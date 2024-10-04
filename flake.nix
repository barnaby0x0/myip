{
  description = "Un flake Nix minimal";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShells.${system} = {
        default = pkgs.mkShell {
          buildInputs = [ 
            pkgs.python3 
            pkgs.python3Packages.requests
          ];
          shellHook = ''
              echo "Bienvenue dans le shell de développement Python !"
              #python -m venv .venv
              #source .venv/bin/activate
          '';
        };
      };


      packages.${system}.default = pkgs.python3Packages.buildPythonPackage {
        pname = "myip";
        version = "1.0.1";
        src = ./src;
        propagatedBuildInputs = with pkgs.python3Packages; [
          setuptools
          requests
        ];
      };

      # Define the default package to build your Python project
      #packages.${system}.default = pkgs.stdenv.mkDerivation {
      #  pname = "myip";   # Replace with your script name
      #  version = "1.0.0";            # Replace with your version

      #  # Specify the path to your Python package (where the script is located)
      #  src = ./.;

      #  #buildInputs = with pkgs; [
      #  #  python3
      #  #  python3Packages.requests
      #  #];
      #  
      #  propagatedBuildInputs = with pkgs; [
      #    python3
      #    python3Packages.requests
      #  ]; 

      #  # Install the script
      #  installPhase = ''
      #    mkdir -p $out/bin
      #    cp src/myip.py $out/bin/myip  
      #    chmod +x $out/bin/myip
      #  '';

      #  meta = with pkgs.lib; {
      #    description = "A Python script to print your public ip";
      #    license = licenses.mit; # Change to your license
      #    maintainers = [ maintainers.yourself ]; # Add yourself as maintainer
      #  };
      #};

    };
}

