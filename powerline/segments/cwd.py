import os

_symbols = {
    1: u'\u278A',
    2: u'\u278B',
    3: u'\u278C',
    4: u'\u278D',
    5: u'\u278E',
    6: u'\u278F',
    7: u'\u2790',
    8: u'\u2791',
    9: u'\u2792',
    10: u'\u2793'
}

def get_short_path_mine(cwd):
    home = os.getenv('HOME')
    names = cwd.split(os.sep)
    if names[0] == '': names = names[1:]
    path = ''
    for i in range(len(names)):
        path += os.sep + names[i]
        if os.path.samefile(path, home):
            return ['~'] + names[i+1:]
    if not names[0]:
        return ['/']
    return names

def add_cwd_mine_segment():
    cwd = powerline.cwd or os.getenv('PWD')
    names = get_short_path_mine(cwd.decode('utf-8'))
    path = '';

    max_depth = powerline.args.cwd_max_depth
    if len(names) > max_depth:
        count = len(names) - max_depth
        #if count in _symbols:
        #    sym = u'%s' % _symbols[count]
        #else:
        #    sym = u'\u25AA\u25AA\u25AA'
        sym = u'\u25AA\u25AA\u25AA'
        sep = ''.join((
            powerline.fgcolor(Color.SEPARATOR_FG),
            '%s' % sym,
            powerline.fgcolor(Color.PATH_FG)
        ))
        names = names[:2] + [sep] + names[2 - max_depth:]

    for n in names:
        if n == '~' and Color.HOME_SPECIAL_DISPLAY:
            path += ''.join((
                powerline.fgcolor(Color.HOME_FG),
                powerline.bgcolor(Color.HOME_BG),
                '~/',
                powerline.bgcolor(Color.PATH_BG),
                powerline.fgcolor(Color.PATH_FG)
            ))
        else:
            path += ''.join((
                n,
                #powerline.fgcolor(Color.SEPARATOR_FG),
                '/' if n != names[-1] else '', # \u2044  powerline.separator_thin,
                #powerline.fgcolor(Color.PATH_FG)
            ))
    # remove the trailing "/"
    #path = path[:-1]
    powerline.append(' %s ' % path, Color.PATH_FG, Color.PATH_BG)

add_cwd_mine_segment()
