[Setting category="Keybindings" name="Use show/hide ghost keybinding"]
bool useDefaultKey = true;

[Setting category="Keybindings" name="Use a dedicated key"]
VirtualKey customKey = VirtualKey(0);

void Main() {
  print("OneTapGhost.as script loaded");
}

bool defaultKey = VirtualKey::F6;
bool held = false;
void OnKeyPress(bool down, VirtualKey key) {
  CGameCtnChallenge@ challenge = GetApp().RootMap;

  if (!useDefaultKey) {
    if (key == defaultKey) {
      if (down) {
        if (!held) {
          print("Default key pressed");
          held = true;
        }
      } else {
        print("Default key released");
        held = false;
      }
    }
  } else {
    if (key == customKey) {
      if (down) {
        if (!held) {
          print("Custom key pressed");
          held = true;
        }
      } else {
        print("Custom key released");
        held = false;
      }
    }
  }
}