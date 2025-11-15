# https://nixos.wiki/wiki/TPM
{ username, ... }: {
  security.tpm2 = {
    enable = true;
    pkcsll.enable = true;
    tctiEnvironment.enable = true;
  };
  users.users.${username}.extraGroups = [ "tss" ];
}
