module.exports = {
	config: {
		updateChannel: "stable",

		// Размер шрифта
		fontSize: 16,

		// Выбор шрифтов
		fontFamily:
			'"Fira Code", Menlo, "DejaVu Sans Mono", Consolas, "Lucida Console", monospace',

		// Жирность шрифта
		fontWeight: "normal",

		// Жирность шрифта для букв, которые должны быть жирные
		fontWeightBold: "bold",

		// Высота строки
		lineHeight: 1.0,

		// Ширина одной буквы
		letterSpacing: 1.2,

		// Цвет курсора в терминале
		cursorColor: "rgba(248,28,229,0.8)",

		// Цвет курсора в терминале в блоке
		cursorAccentColor: "#010",

		// `'BEAM'` for |, `'UNDERLINE'` for _, `'BLOCK'` for █
		cursorShape: "BLOCK",

		// Мерцание курсора
		cursorBlink: true,

		// Цвет текста
		foregroundColor: "#f5f5f5",

		// Цвет фона
		backgroundColor: "#000",

		// Цвет при выделении текста
		selectionColor: "rgba(248,28,229,0.3)",

		// border color (window, tabs)
		borderColor: "#333",

		// custom CSS to embed in the main window
		css: "overflow:hidden;",

		// custom CSS to embed in the terminal window
		termCSS: "",

		// if you're using a Linux setup which show native menus, set to false
		// default: `true` on Linux, `true` on Windows, ignored on macOS
		showHamburgerMenu: "",

		// set to `false` (without backticks and without quotes) if you want to hide the minimize, maximize and close buttons
		// additionally, set to `'left'` if you want them on the left, like in Ubuntu
		// default: `true` (without backticks and without quotes) on Windows and Linux, ignored on macOS
		showWindowControls: "",

		// custom padding (CSS format, i.e.: `top right bottom left`)
		padding: "0 0 0 0",

		// the full list. if you're going to provide the full color palette,
		// including the 6 x 6 color cubes and the grayscale map, just provide
		// an array here instead of a color map object

		// the shell to run when spawning a new session (i.e. /usr/local/bin/fish)
		// if left empty, your system's login shell will be used by default
		//
		// Windows
		// - Make sure to use a full path if the binary name doesn't work
		// - Remove `--login` in shellArgs
		//
		// Bash on Windows
		// - Example: `C:\\Windows\\System32\\bash.exe`
		//
		// PowerShell on Windows
		// - Example: `C:\\WINDOWS\\System32\\WindowsPowerShell\\v1.0\\powershell.exe`
		shell: "/bin/zsh",

		// for setting shell arguments (i.e. for using interactive shellArgs: `['-i']`)
		// by default `['--login']` will be used
		shellArgs: ["--login"],

		// for environment variables
		env: {},

		// set to `false` for no bell
		bell: "SOUND",

		// if `true` (without backticks and without quotes), selected text will automatically be copied to the clipboard
		copyOnSelect: true,

		// if `true` (without backticks and without quotes), hyper will be set as the default protocol client for SSH
		defaultSSHApp: true,

		// if `true` (without backticks and without quotes), on right click selected text will be copied or pasted if no
		// selection is present (`true` by default on Windows and disables the context menu feature)
		quickEdit: false,

		// choose either `'vertical'`, if you want the column mode when Option key is hold during selection (Default)
		// or `'force'`, if you want to force selection regardless of whether the terminal is in mouse events mode
		// (inside tmux or vim with mouse mode enabled for example).
		macOptionSelectionMode: "vertical",

		// URL to custom bell
		// bellSoundURL: 'http://example.com/bell.mp3',

		// Whether to use the WebGL renderer. Set it to false to use canvas-based
		// rendering (slower, but supports transparent backgrounds)
		webGLRenderer: true

		// for advanced config flags please refer to https://hyper.is/#cfg
	},

	// a list of plugins to fetch and install from npm
	// format: [@org/]project[#version]
	// examples:
	//   `hyperpower`
	//   `@company/project`
	//   `project#1.0.1`
	plugins: [
		"hyper-tabs-enhanced",
		"hyperterm-paste",
		"hyperterm-summon",
		"hyper-afterglow",
		"hyper-pane",
		"hyper-fading-scrollbar"
		//"hyper-letters"
	],
	// in development, you can create a directory under
	// `~/.hyper_plugins/local/` and include it here
	// to load it and avoid it being `npm install`ed
	localPlugins: [],

	keymaps: {
		// Example
		// 'window:devtools': 'cmd+alt+o',
	}
};
