class Color(DefaultColor):

    base02 = 2
    base03 = 3
    base04 = 4
    base05 = 6

    USERNAME_FG = 15
    USERNAME_BG = 4
    USERNAME_ROOT_BG = 1

    HOSTNAME_FG = 0
    HOSTNAME_BG = 6

    HOME_SPECIAL_DISPLAY = True
    HOME_FG = 7
    HOME_BG = 0
    PATH_FG = 7
    PATH_BG = 0
    CWD_FG = 7
    SEPARATOR_FG = 8

    READONLY_BG = 1
    READONLY_FG = 15

    REPO_CLEAN_FG = 0
    REPO_CLEAN_BG = 2
    REPO_DIRTY_FG = 0
    REPO_DIRTY_BG = 3

    JOBS_FG = 4
    JOBS_BG = 8

    CMD_PASSED_FG = 7
    CMD_PASSED_BG = 0
    CMD_FAILED_FG = 15
    CMD_FAILED_BG = 1

    SVN_CHANGES_FG = REPO_DIRTY_FG
    SVN_CHANGES_BG = REPO_DIRTY_BG

    VIRTUAL_ENV_BG = 15
    VIRTUAL_ENV_FG = 2
