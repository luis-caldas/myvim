# My simple vim configuration

### Installation

Source the `vimrc.vim` file to your `.vimrc` script

#### How to do it:

	let s:path = fnamemodify(resolve(expand('<sfile>:p')), ':h')
	exec 'source' s:path . "/{PATH TO YOUR VIM FOLDER}/vimrc.vim"
