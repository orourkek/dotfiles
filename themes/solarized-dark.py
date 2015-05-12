class Color(DefaultColor):

    SOLARIZED_0 = 8
    SOLARIZED_1 = 0
    GREEN = 2
    BLUE = 4
    RED = 1
    CYAN = 6
    PINK = 5
    YELLOW = 3
    WHITE = 7
    GREY_0 = 10
    GREY_1 = 11
    GREY_2 = 12
    GREY_3 = 14
    ORANGE = 9
    PURPLE = 13

    USERNAME_FG = WHITE
    USERNAME_BG = BLUE
    USERNAME_ROOT_BG = RED

    HOSTNAME_FG = 15
    HOSTNAME_BG = CYAN

    HOME_SPECIAL_DISPLAY = True
    HOME_FG = WHITE
    HOME_BG = GREY_3
    PATH_FG = SOLARIZED_1
    PATH_BG = GREY_1
    CWD_FG = SOLARIZED_1
    SEPARATOR_FG = SOLARIZED_1

    READONLY_BG = RED
    READONLY_FG = WHITE

    REPO_CLEAN_FG = WHITE
    REPO_CLEAN_BG = GREEN
    REPO_DIRTY_FG = WHITE
    REPO_DIRTY_BG = YELLOW

    JOBS_FG = 4
    JOBS_BG = 8

    CMD_PASSED_FG = WHITE
    CMD_PASSED_BG = SOLARIZED_1
    CMD_FAILED_FG = WHITE
    CMD_FAILED_BG = ORANGE

    SVN_CHANGES_FG = REPO_DIRTY_FG
    SVN_CHANGES_BG = REPO_DIRTY_BG

    VIRTUAL_ENV_BG = 15
    VIRTUAL_ENV_FG = 2
