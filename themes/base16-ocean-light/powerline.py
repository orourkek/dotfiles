class Color(DefaultColor):

    black = 0
    red = 1
    green = 2
    yellow = 3
    blue = 4
    magenta = 5
    cyan = 6
    white = 7
    base01 = 8
    red2 = 9
    base02 = 10
    base03 = 11
    base04 = 12
    magenta2 = 13
    base05 = 14
    white2 = 15

    USERNAME_FG = white2
    USERNAME_BG = blue
    USERNAME_ROOT_BG = red

    HOSTNAME_FG = white2
    HOSTNAME_BG = base04

    HOME_SPECIAL_DISPLAY = True
    HOME_FG = base03
    HOME_BG = base05
    PATH_FG = base03
    PATH_BG = base05
    CWD_FG = white2
    SEPARATOR_FG = base02

    READONLY_BG = red
    READONLY_FG = white2

    REPO_CLEAN_FG = white2
    REPO_CLEAN_BG = green
    REPO_DIRTY_FG = white2
    REPO_DIRTY_BG = yellow

    JOBS_FG = blue
    JOBS_BG = white2

    CMD_PASSED_FG = base03
    CMD_PASSED_BG = base05
    CMD_FAILED_FG = white2
    CMD_FAILED_BG = red

    SVN_CHANGES_FG = REPO_DIRTY_FG
    SVN_CHANGES_BG = REPO_DIRTY_BG

    VIRTUAL_ENV_BG = 15
    VIRTUAL_ENV_FG = 2
