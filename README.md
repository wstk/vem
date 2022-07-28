# vem, Virtual Environment Manager

Save yourself a few keystokes.

## Requirements

Python 3 as a base interpreter.

## Use `vem`

Clone the repository, and [add the directory to your user search path](https://stackoverflow.com/questions/44272416/how-to-add-a-folder-to-path-environment-variable-in-windows-10-with-screensho).

```
vem -n venv-demo
```

Creates a new Virtual Environment in the current folder, with the name `venv-demo`.

To activate it, simply navigate to the directory and 

```
vem
```

`vem` is configured to look for Virtual Environments whose name match the pattern `\ve*` e.g `\venv`, `\venv-name`, \`venvname`

To enable a venv with a bespoke name

```
vem name-of-venv
```

Once you are done, you can deactivate the current Virtual Environment with

```
vem off
```

For all options, it's 

```
vem -h
```

## Author

Will King Stokes, willstokes88@gmail.com. Any bugs or issues let me know.

## License

GNU GPL 3.0