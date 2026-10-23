# Walking fox in React Three Fiber

A Gaitkit GLB in a Vite + React Three Fiber app: two foxes walk a circle, playing the model's own **Walk** clip at a speed
matched to how fast they move, so their paws stay planted.

```sh
npm install
npm run dev
```

`public/fox.glb` is the free [Fox](https://gaitkit.com/asset/fox) with its default knobs. To use another look, tune the
knobs on the model's page and press **Download GLB**: the file you get carries your settings.

Why the GLB and not the ES module? Bundlers (Vite, webpack, Next.js) do not import `https://` modules, and the module's
bare `three` import must resolve to your app's copy. For live knobs or feet that follow terrain, copy the module and the
runtime into your project instead; the [React Three Fiber guide](https://gaitkit.com/guides/react-three-fiber-animated-model)
shows both routes.

Clips in Gaitkit GLBs: walkers carry `Walk` (an in-place cycle covering `gait.clip_speed` m/s at 1x); vehicles, flyers and
swimmers carry `Loop` (one cycle per `loop_m` metres of travel).
