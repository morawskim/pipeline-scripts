class RegexConstants
  COMMIT_TITLE_REGEX = /^#\d+[ -]+[[a-zA-Z0-9\w]\-\\\/\ \p{L}'"\.,\+\(\)&:\@]+$|^Merge branch '[\w\-.]+' into '?[\w\-.]+'?$/u
end
