class Color(DefaultColor):

    black = 0
    red = 1
    green = 2
    yellow = 3
    blue = 4
    magenta = 5
    cyan = 6
    white = 7
    black2 = 8
    red2 = 9
    green2 = 10
    yellow2 = 11
    blue2 = 12
    magenta2 = 13
    cyan2 = 14
    white2 = 15

    USERNAME_FG = white
    USERNAME_BG = blue
    USERNAME_ROOT_BG = red

    HOSTNAME_FG = white
    HOSTNAME_BG = magenta2

    HOME_SPECIAL_DISPLAY = True
    HOME_FG = white
    HOME_BG = blue2
    PATH_FG = white
    PATH_BG = blue2
    CWD_FG = white
    SEPARATOR_FG = green2

    READONLY_BG = red
    READONLY_FG = white

    REPO_CLEAN_FG = white
    REPO_CLEAN_BG = green
    REPO_DIRTY_FG = white
    REPO_DIRTY_BG = yellow

    JOBS_FG = blue
    JOBS_BG = white

    CMD_PASSED_FG = green2
    CMD_PASSED_BG = white
    CMD_FAILED_FG = white
    CMD_FAILED_BG = red

    SVN_CHANGES_FG = REPO_DIRTY_FG
    SVN_CHANGES_BG = REPO_DIRTY_BG

    VIRTUAL_ENV_BG = 15
    VIRTUAL_ENV_FG = 2
