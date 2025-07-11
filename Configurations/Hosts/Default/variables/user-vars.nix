# ./User/variables.nix
let
  username = "default";
in
{
  inherit username nixDirectory;
  gitUsername = "Default-user-vars.nix";
  gitEmail = "user-vars.nix@host.configuration";
}

