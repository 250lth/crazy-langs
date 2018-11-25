amIRich money
  | money < 0 = "You are broken, sir"
  | 0 <= money && money < 10000 = "You are not rich, sir"
  | 10000 <= money && money < 1000000 = "You are rich, sir"
  | otherwise = "You are very rich, sir"
