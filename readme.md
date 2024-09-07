# cool anti aliasing for lowrez sprites in a highrez world

about a year or more ago this youtuber named t3ssel8r uploaded a [video](https://www.youtube.com/watch?v=d6tp43wZqps) describing a new and cool method for antialiasing what is essentially low resolution billboards on high resolution render targets, in 3d. this is really nice if you make the kinds of things that i like to make: twodee threedee.

here is an example of the filter in use, make sure you watch at fullscreen and in hd. the right side is with the filter, the left side is without it.

[![YouTube](http://i.ytimg.com/vi/fylwX6hnKDk/hqdefault.jpg)](https://www.youtube.com/watch?v=fylwX6hnKDk)

## how to use it

download the yymps and drag it to your project. the rest is pretty easy: you need to disable automatic app surface drawing and then apply the filter to your app surface when its time to render the frame:

so, for example your create event might look like this:
```js
frame_width = 1920;
frame_height = 1080;

surface_resize(application_surface, frame_width, frame_height);
application_surface_draw_enable(false);

frame_size_uniform = shader_get_uniform(twodee_threedee_pixel_art_aa_filter, "frame_size");
```
and then your post draw event would look like this:
```js
shader_set(twodee_threedee_pixel_art_aa_filter) {
    shader_set_uniform_f(frame_size_uniform, frame_width, frame_height);
    gpu_set_tex_filter(true);

    draw_surface(application_surface, 0, 0);

    gpu_set_tex_filter(false);
    shader_reset();
}
```

and that's really it. its a very small shader, doesn't blow out your render pipeline. the only requirement is that you need a higher resolution app surface for this to make sense, and you have to use the hardware texture filter to take advantage of what makes this method so cool.

have fun, babies!
