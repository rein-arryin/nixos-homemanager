{ config, inputs, pkgs, pkgs-stable, ... }:

{
  imports = [
    inputs.zen-browser.homeModules.beta
   ]; 

  home.username = "neo";
  home.homeDirectory = "/home/neo";
  home.stateVersion = "25.11"; 
  home.packages = with pkgs; [
    inputs.helium.packages.${pkgs.system}.helium
    ani-cli
    btop
    figlet
    cava
    cmatrix
    gh
    git
    yazi
    zed-editor

    # Environtment
    gcc
    gdb

    # Apps
    pkgs-stable.kdePackages.gwenview
    pkgs-stable.pinta
    pkgs-stable.vesktop
    brave
    vscode
    alacritty
    tor-browser

    # Cursor
    bibata-cursors

  ];

  home.file = {
  };

  xdg.configFile."gtk-4.0/gtk.css".force = true;

  home.sessionVariables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
    WLR_NO_HARDWARE_CURSORS = "1";    
  };

  home.shellAliases = {
    z = "zeditor";
    v = "nvim";
    btw = "fastfetch";
    cx = "cmatrix";
    cv = "cava";
  };  

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors; 
    name = "Bibata-Modern-Classic";
    size = 24;
   }; 

   gtk = {
     enable = true;
     theme = {
       name = "Tokyonight-Dark";
       package = pkgs.tokyonight-gtk-theme;  
     };
     iconTheme = {
       name = "Dracula";
       package = pkgs.dracula-icon-theme;
     };  
    };

  programs.starship.enable = true; 
  programs.zsh.enable = true;
  programs.zen-browser.enable = true;
  programs.home-manager.enable = true;
}
