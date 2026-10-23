# Walking fox in three.js

Two foxes walk a closed loop around a boulder. Each leg is a two-bone IK chain, and the pose is driven by the distance
walked, not by time: change the speed and the paws still land and stay planted.

```sh
npx serve .        # or: python3 -m http.server
# open http://localhost:3000 (or :8000)
```

No build step and no install: three.js comes from a CDN through an import map, and the models load as ES modules from
`https://gaitkit.com/cdn/`. The fox, the boulder and the hedge are free models, so this runs without an account.

What to look at in `index.html`:

- `fox({ coat: 'arctic', ears: 1.8 })` builds a variant from typed knobs. Every knob is listed on the
  [fox's page](https://gaitkit.com/asset/fox) and in its schema, `https://gaitkit.com/cdn/fox-params.json`.
- `walker(model).poseAt(distance)` poses the legs. Move the model first, then call `poseAt` with the same distance.
- For uneven ground pass a height function: `walker(model, { ground: (x, z) => heightAt(x, z) })`, or
  `raycastGround([terrainMesh])` from the same runtime.

Guide: [How to add a walking 3D creature to a three.js scene](https://gaitkit.com/guides/animated-3d-model-threejs).
