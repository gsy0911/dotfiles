# ffmpeg

convert `.mov` to `.gif`

```
$ ffmpeg -i input.mov -vf "fps=15,scale=640:-1:flags=lanczos,palettegen" -frames:v 1 palette.png
```

then


```
$ ffmpeg -i input.mov -i palette.png -filter_complex "fps=15,scale=640:-1:flags=lanczos[x];[x][1:v]paletteuse" output.gif
```
