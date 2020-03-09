# My simple vim configuration

### Installation

Link the `dotvim/pack` folder to the inside of your `~/.vim` folder

Source the `vimrc.vim` file to your `.vimrc` script

#### How to source a file in vimscript:

	let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
	exec 'source' s:path . "/{PATH TO THIS FOLDER}/vimrc.vim"

