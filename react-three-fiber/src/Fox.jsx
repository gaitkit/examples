import { useEffect, useRef } from 'react';
import { useFrame } from '@react-three/fiber';
import { useGLTF, useAnimations, Clone } from '@react-three/drei';

// The Walk clip in a Gaitkit GLB is an in-place cycle that covers `clipSpeed` metres per second at 1x
// (gait.clip_speed on https://gaitkit.com/asset/fox, or from the MCP tool get_asset). Play it at speed / clipSpeed
// and move the model at `speed`: the paws then stay planted instead of skating.
const CLIP_SPEED = 0.375;

export function Fox({ speed = 0.45, radius = 1.2, phase = 0 }) {
  const group = useRef();
  const { scene, animations } = useGLTF('/fox.glb');      // public/fox.glb, a free model from gaitkit.com
  const { actions } = useAnimations(animations, group);
  const angle = useRef(phase);

  useEffect(() => {
    const walk = actions.Walk;
    walk?.play();
    if (walk) walk.timeScale = speed / CLIP_SPEED;
  }, [actions, speed]);

  useFrame((_, dt) => {
    angle.current += (speed / radius) * Math.min(dt, 0.05);          // walk a circle at `speed` metres per second
    const a = angle.current;
    group.current.position.set(Math.sin(a) * radius, 0, Math.cos(a) * radius);
    group.current.rotation.y = a + Math.PI / 2;                       // models face +Z: turn them along the circle
  });

  // Clone gives each fox its own copy of the skeleton-free node tree, so two foxes can walk at once
  return <group ref={group}><Clone object={scene} castShadow receiveShadow /></group>;
}

useGLTF.preload('/fox.glb');
