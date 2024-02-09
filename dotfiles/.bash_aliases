alias bal='vim ~/.bash_aliases'

alias cd..='cd ..'

# Messaging
alias slack='nohup slack >/dev/null 2>&1 &'
alias messenger='nohup google-chrome --app=https://www.messenger.com >/dev/null 2>&1 &'
alias whatsapp='nohup google-chrome --app=https://web.whatsapp.com >/dev/null 2>&1 &'
alias sms='nohup google-chrome --app=https://messages.android.com >/dev/null 2>&1 &'

alias we='curl http://wttr.in/sacramento'
alias ipaddr="awk '{print $2}' <(ifconfig wlp58s0 | grep 'inet');"

alias gs='git status'

alias gephi='/opt/gephi-0.9.7/bin/gephi'
