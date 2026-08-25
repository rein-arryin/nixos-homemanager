{ config, lib, inputs, pkgs, pkgs-stable, ... }:

{
  home.username = "neo";
  home.homeDirectory = "/home/neo";
  home.stateVersion = "25.11"; 
  home.packages = with pkgs; [
    ani-cli
    nh
    gh
    git
    yazi
    mrpack-install
    #pcsx2
    lutris
    protonup-qt
    qbittorrent

    # Terminal
    btop
    figlet
    cava
    cmatrix
    tty-clock

    # Environtment
    wlopm


    # Apps
    inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    pkgs-stable.kdePackages.gwenview
    pkgs-stable.pinta
    pkgs-stable.vesktop
    brave
    vscode
    alacritty
    tor-browser
    android-studio
    localsend
    obsidian
    amberol
    zed-editor
    antigravity
    gparted
    qdirstat
    whatsie

    # Cursor
    bibata-cursors

    # ScreenShot & Edit
    grim
    swappy
    slurp
    imagemagick

    # Kde SHit
    # GUI Theme Configurators
    libsForQt5.qt5ct
    kdePackages.qt6ct

    # Kvantum Engines (Qt5 & Qt6)
    libsForQt5.qtstyleplugin-kvantum
    kdePackages.qtstyleplugin-kvantum

    # Qt Wayland Support
    libsForQt5.qtwayland
    kdePackages.qtwayland
  ];

  home.file = {
  };
  
  xdg.mimeApps = {
    enable = false;
  };    

  # Disable KDE Plasma's GTK sync module
xdg.configFile."kded5rc".text = ''
  [Module-gtkconfig]
  autoload=false
'';

xdg.configFile."kded6rc".text = ''
  [Module-gtkconfig]
  autoload=false
'';
  
xdg.configFile."Kvantum/kvantum.kvconfig".text = ''
    [General]
    theme=Catppuccin-Mocha-Blue
  '';

  # 3. Tell qt5ct/qt6ct to pick Kvantum as the style
  xdg.configFile."qt5ct/qt5ct.conf".text = ''
    [Appearance]
    style=kvantum
  '';
  xdg.configFile."qt6ct/qt6ct.conf".text = ''
    [Appearance]
    style=kvantum
  '';

  home.sessionVariables = {
    QT_QPA_PLATFORM = "wayland;xcb";
    QT_WAYLAND_DISABLE_WINDOWDECORATION = "1";

    XCURSOR_THEME = "Bibata-Modern-Ice";
    XCURSOR_SIZE = "24";
    WLR_NO_HARDWARE_CURSORS = "1";
    EDITOR = "nvim";
    TERMINAL = "alacritty";
  };

  home.shellAliases = {
    vhm = "nvim ~/.config/home-manager/home.nix";
    hms-flake = "cd ~/.config/home-manager && home-manager switch --flake . && cd -";
    z = "zeditor";
    v = "nvim";
    btw = "fastfetch";
    cx = "cmatrix";
    cv = "cava";
    cn = "cd /etc/nixos";
    sklauncher = "steam-run java -jar /home/neo/Minecraft/SKlauncher-3.2.18.jar";
  };  

  home.pointerCursor = {
    enable = true;
    gtk.enable = true;
    x11.enable = true;
    package = pkgs.bibata-cursors; 
    name = "Bibata-Modern-Ice";
    size = 24;
   }; 

   gtk = {
     enable = true;
     gtk2.enable = false;
     gtk4.theme = null;
    };

    qt = {
      enable = true;
    };
      
  # Shell
  programs.bash.enable = true;
  programs.starship = {
    enable = true;
    enableBashIntegration = true;
  };  

  programs.home-manager.enable = true;
  programs.rmpc = {
    enable = true;
  };  
}
