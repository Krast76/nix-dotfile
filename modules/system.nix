{ config, pkgs, ...}:

{
  system.defaults = {
     trackpad = {
       TrackpadRightClick = true;
       TrackpadCornerSecondaryClick = 2;
       /*Click = true;*/
     };
  };
}
