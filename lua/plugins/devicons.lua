return {
	"nvim-tree/nvim-web-devicons",
	config = function()
		require("nvim-web-devicons").setup({
			-- 全局默认设置
			override = {
				zsh = {
					icon = "",
					color = "#428850",
					cterm_color = "65",
					name = "Zsh",
				},
				lua = {
					icon = "",
					color = "#51a0cf",
					cterm_color = "74",
					name = "Lua",
				},
				js = {
					icon = "",
					color = "#cbcb41",
					cterm_color = "185",
					name = "JavaScript",
				},
				ts = {
					icon = "",
					color = "#519aba",
					cterm_color = "67",
					name = "TypeScript",
				},
				jsx = {
					icon = "",
					color = "#61dafb",
					cterm_color = "45",
					name = "JSX",
				},
				tsx = {
					icon = "",
					color = "#519aba",
					cterm_color = "67",
					name = "TSX",
				},
				html = {
					icon = "",
					color = "#e34c26",
					cterm_color = "196",
					name = "HTML",
				},
				css = {
					icon = "",
					color = "#563d7c",
					cterm_color = "56",
					name = "CSS",
				},
				scss = {
					icon = "",
					color = "#cc6699",
					cterm_color = "169",
					name = "SCSS",
				},
				json = {
					icon = "",
					color = "#cbcb41",
					cterm_color = "185",
					name = "JSON",
				},
				md = {
					icon = "",
					color = "#519aba",
					cterm_color = "67",
					name = "Markdown",
				},
				py = {
					icon = "",
					color = "#4b8bbe",
					cterm_color = "61",
					name = "Python",
				},
				java = {
					icon = "",
					color = "#cc3e44",
					cterm_color = "167",
					name = "Java",
				},
				c = {
					icon = "",
					color = "#599eff",
					cterm_color = "75",
					name = "C",
				},
				cpp = {
					icon = "",
					color = "#f34b7d",
					cterm_color = "204",
					name = "CPP",
				},
				go = {
					icon = "",
					color = "#519aba",
					cterm_color = "67",
					name = "Go",
				},
				rust = {
					icon = "",
					color = "#dea584",
					cterm_color = "180",
					name = "Rust",
				},
				vim = {
					icon = "",
					color = "#019833",
					cterm_color = "28",
					name = "Vim",
				},
				sh = {
					icon = "",
					color = "#4d5a5e",
					cterm_color = "240",
					name = "Shell",
				},
				fish = {
					icon = "",
					color = "#4d5a5e",
					cterm_color = "240",
					name = "Fish",
				},
				git = {
					icon = "",
					color = "#f34f29",
					cterm_color = "202",
					name = "Git",
				},
				[".gitignore"] = {
					icon = "",
					color = "#f34f29",
					cterm_color = "202",
					name = "GitIgnore",
				},
				yml = {
					icon = "",
					color = "#6d8086",
					cterm_color = "66",
					name = "YAML",
				},
				yaml = {
					icon = "",
					color = "#6d8086",
					cterm_color = "66",
					name = "YAML",
				},
				toml = {
					icon = "",
					color = "#6d8086",
					cterm_color = "66",
					name = "TOML",
				},
				docker = {
					icon = "",
					color = "#458ee6",
					cterm_color = "68",
					name = "Docker",
				},
				Dockerfile = {
					icon = "",
					color = "#458ee6",
					cterm_color = "68",
					name = "Dockerfile",
				},
				["docker-compose.yml"] = {
					icon = "",
					color = "#458ee6",
					cterm_color = "68",
					name = "DockerCompose",
				},
			},
			-- 默认图标（当没有匹配的文件类型时）
			default = true,
			-- 启用严格模式（需要精确匹配）
			strict = true,
			-- 根据操作系统覆盖默认图标
			override_by_filename = {
				[".gitignore"] = {
					icon = "",
					color = "#f34f29",
					name = "GitIgnore",
				},
				["LICENSE"] = {
					icon = "",
					color = "#d0bf41",
					name = "License",
				},
				["README.md"] = {
					icon = "",
					color = "#519aba",
					name = "Readme",
				},
				["package.json"] = {
					icon = "",
					color = "#e8274b",
					name = "PackageJson",
				},
				["package-lock.json"] = {
					icon = "",
					color = "#7a0d21",
					name = "PackageLockJson",
				},
				["yarn.lock"] = {
					icon = "",
					color = "#2c8ebb",
					name = "YarnLock",
				},
				["tsconfig.json"] = {
					icon = "",
					color = "#519aba",
					name = "TSConfig",
				},
				[".eslintrc.js"] = {
					icon = "",
					color = "#4b32c3",
					name = "Eslint",
				},
				[".prettierrc"] = {
					icon = "",
					color = "#f7b93e",
					name = "Prettier",
				},
				["Makefile"] = {
					icon = "",
					color = "#6d8086",
					name = "Makefile",
				},
			},
			-- 根据扩展名覆盖
			override_by_extension = {
				["log"] = {
					icon = "",
					color = "#81e043",
					name = "Log",
				},
				["txt"] = {
					icon = "",
					color = "#89e051",
					name = "Text",
				},
				["pdf"] = {
					icon = "",
					color = "#b30b00",
					name = "Pdf",
				},
				["zip"] = {
					icon = "",
					color = "#dad71a",
					name = "Zip",
				},
				["tar"] = {
					icon = "",
					color = "#dad71a",
					name = "Tar",
				},
				["gz"] = {
					icon = "",
					color = "#dad71a",
					name = "Gzip",
				},
			},
		})
	end,
}
