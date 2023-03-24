#  create a manifest that kills a process named killmenow.

exec = { 'pkill killmenow':
    command => 'pkill killmenow',
    path    => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
}
