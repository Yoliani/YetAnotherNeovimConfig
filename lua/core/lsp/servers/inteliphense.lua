local intelephense_settings = {
	cmd = { "intelephense", "--stdio" },
	filetypes = { "php" },
	intelephense = {
		stubs = {
			"bcmath",
			"bz2",
			"calendar",
			"Core",
			"curl",
			"zip",
			"zlib",
			"wordpress",
			"woocommerce",
			"acf-pro",
			"wordpress-globals",
			"wp-cli",
			"genesis",
			"polylang",
		},
		files = {
			maxSize = 5000000,
		},
	},
}

return intelephense_settings
