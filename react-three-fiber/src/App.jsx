import { Canvas } from '@react-three/fiber';
import { OrbitControls } from '@react-three/drei';
import { Fox } from './Fox.jsx';

export function App() {
  return (
    <Canvas shadows camera={{ position: [0.4, 1.6, 3.6], fov: 38 }}>
      <color attach="background" args={['#e9e4d8']} />
      <hemisphereLight args={['#ffffff', '#8a8f80', 2.2]} />
      <directionalLight position={[3, 6, 4]} intensity={2.4} castShadow />
      <mesh rotation-x={-Math.PI / 2} receiveShadow>
        <circleGeometry args={[6, 64]} />
        <meshStandardMaterial color="#b9c2a8" />
      </mesh>
      <Fox speed={0.45} />
      <Fox speed={0.45} phase={Math.PI} />
      <OrbitControls target={[0, 0.25, 0]} />
    </Canvas>
  );
}
