local Translations = {
    popcorns = {
      ["target_label"] = "Pop Corn",
      ["popcorn_animation_label"] = "THE CORNY IS BOUNCING...",
      ["popcorn_animation_canceled"] = "Changed your mind",
      ["already_popcorn_error"] = "Someone here is already doing it",
      ["messed_up_error"] = "WELL THAT DIDN'T WORK!!!",
      ["popcorn_ready"] = "Your treat is ready!",
    },
  }
  Lang = Locale:new({
      phrases = Translations,
      warnOnMissing = true
  })