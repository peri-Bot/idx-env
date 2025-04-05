{ pkgs, ... }: {
  # Which nixpkgs channel to use.
  channel = "unstable"; # or "stable-24.05"

  # Use https://search.nixos.org/packages to find packages
  packages = [
    pkgs.eza
		pkgs.htop
    pkgs.newman
    pkgs.xclip
    pkgs.rustc
    pkgs.cargo
    pkgs.starship
    pkgs.dwt1-shell-color-scripts
    pkgs.fastfetch
    pkgs.glibc
    pkgs.gcc
    pkgs.fzf
    pkgs.luajitPackages.luarocks_bootstrap
    pkgs.lua
    pkgs.neovim
    pkgs.zig
    pkgs.rustup
    pkgs.go
    pkgs.python311
    pkgs.python311.pkgs.pip
    pkgs.nodejs_20
    pkgs.zsh
    # pkgs.nodePackages.nodemon
  ];

  # Sets environment variables in the workspace
  env = {    
		ZSH_DISABLE_COMPFIX = "true";
		Copper_Lounge = "67a74fa99076d6f7e08474fe";
		Silver_Arena = "67a74ffa9076d6f7e0847501";
		Gold_Chamber = "67a750129076d6f7e0847504";
		Platinum_Hall = "67a7502b9076d6f7e0847507";
		Diamond_Vault = "67a750399076d6f7e084750a";
		Elite_Pavilion = "67a750479076d6f7e084750d";
 	};
  idx = {
    # Search for the extensions you want on https://open-vsx.org/ and use "publisher.id"
    extensions = [
      "vscodevim.vim"
      "esbenp.prettier-vscode"
    ];

    # Enable previews
    previews = {
      enable = true;
      previews = {
        web = {
          # Example: run "npm run dev" with PORT set to IDX's defined port for previews,
          # and show it in IDX's web preview panel
          command = [
            "npm"
            "run"
            "dev"
            "--"
            "--port"
            "$PORT"
            "--host"
            "0.0.0.0"
          ];
          manager = "web";
          cwd = "PB-miniApp-frontend";
          env = {
            # Environment variables to set for your server
            PORT = "$PORT";
          };
        };
      };
    };

    # Workspace lifecycle hooks
    workspace = {
      # Runs when a workspace is first created
      onCreate = {
        # Example: install JS dependencies from NPM
        # npm-install = "npm install";
      };
      # Runs when the workspace is (re)started
      onStart = {
        # Example: start a background task to watch and re-build backend code
        # watch-backend = "npm run watch-backend";
          install-omz = "curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh  | sh";
      };
    };
  };
}
