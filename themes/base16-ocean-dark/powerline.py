class Color(DefaultColor):

    black = 0
    red = 1
    red2 = 9 #orange
    green = 10
    yellow = 11
    blue = 12
    magenta = 5
    magenta2 = 13 #sienna
    cyan = 14
    white = 7
    white2 = 15
    grey = 8

    base02 = 2
    base03 = 3
    base04 = 4
    base05 = 6

    USERNAME_FG = black
    USERNAME_BG = green
    USERNAME_ROOT_BG = red

    HOSTNAME_FG = black
    HOSTNAME_BG = cyan

    HOME_SPECIAL_DISPLAY = True
    HOME_FG = white2
    HOME_BG = grey
    PATH_FG = white2
    PATH_BG = grey
    CWD_FG = white
    SEPARATOR_FG = grey

    READONLY_BG = red
    READONLY_FG = white2

    REPO_CLEAN_FG = black
    REPO_CLEAN_BG = green
    REPO_DIRTY_FG = black
    REPO_DIRTY_BG = yellow

    JOBS_FG = 4
    JOBS_BG = 8

    CMD_PASSED_FG = white
    CMD_PASSED_BG = black
    CMD_FAILED_FG = white2
    CMD_FAILED_BG = red

    SVN_CHANGES_FG = REPO_DIRTY_FG
    SVN_CHANGES_BG = REPO_DIRTY_BG

    VIRTUAL_ENV_BG = 15
    VIRTUAL_ENV_FG = 2
