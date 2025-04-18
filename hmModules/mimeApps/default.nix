{ ... }:

{
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "application/pdf" = [
        "org.pwmt.zathura.desktop"
        "brave-browser.desktop"
      ];
      "application/zip" = [ "xarchiver.desktop" ];
      "application/x-7z-compressed" = [ "xarchiver.desktop" ];
      "application/x-zip-compressed" = [ "xarchiver.desktop" ];
      "application/vnd.openxmlformats-officedocument.wordprocessingml.document" = [ "writer.desktop" ]; # .docx
      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet" = [ "calc.desktop" ]; # .xlsx
      "application/vnd.openxmlformats-officedocument.presentationml.presentation" = [
        "impress.desktop"
      ]; # .pptx
      "application/vnd.ms-powerpoint" = [ "impress.desktop" ]; # .ppt
      "application/xml" = [ "calc.desktop" ];
      "image/*" = [ "swayimg.desktop" ];
      "image/png" = [ "swayimg.desktop" ];
      "image/jpeg" = [ "swayimg.desktop" ];
      "video/*" = [ "mpv.desktop" ];
      "text/html" = [ "brave-browser.desktop" ];
      "x-scheme-handler/http" = [ "brave-browser.desktop" ];
      "x-scheme-handler/https" = [ "brave-browser.desktop" ];
      "x-scheme-handler/about" = [ "brave-browser.desktop" ];
      "x-scheme-handler/mailto" = [ "brave-browser.desktop" ];
      "x-scheme-handler/unknown" = [ "brave-browser.desktop" ];
    };
  };
}
