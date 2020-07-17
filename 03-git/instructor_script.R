library(tidyverse)
library(ghclass)

### Activity 1

roster = googlesheets4::read_sheet("https://docs.google.com/spreadsheets/d/1A6hoJmzh2tIG4hBAZDirT4klTYV7O-bEkoEBqyrdy8M/edit?ts=5f10d933#gid=1592335010") %>%
  setNames(c("timestamp", "github"))

org_create_assignment(
  org = "ghclass-demo",
  repo = paste0("hw01-", roster$github),
  user = roster$github,
  source_repo = "rundel/hw1"
)



### Activity 2

repo_mirror_template(
  source_repo = "rundel/hw1",
  target_repo = "ghclass-demo/hw01-everyone",
  private = FALSE
)


### Add Badge

action_add_badge(
  repo = org_repos("ghclass-demo", "hw01-")
)

