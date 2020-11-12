alias bal='vim ~/.bash_aliases'

alias cd..='cd ..'
alias scan='scangearmp'

# Launch virtualenv ipython, not system-wide ipython
alias ipy="python -c 'import IPython; IPython.terminal.ipapp.launch_new_instance()'"

# Google productivity suite
alias gmail='nohup google-chrome --app=https://www.gmail.com >/dev/null 2>&1 &'
alias gdrive='nohup google-chrome --app=https://drive.google.com >/dev/null 2>&1 &'
alias gcalendar='nohup google-chrome --app=https://calendar.google.com >/dev/null 2>&1 &'
alias docs='nohup google-chrome --app=https://docs.google.com/document/u/0/ >/dev/null 2>&1 &'
alias sheets='nohup google-chrome --app=https://docs.google.com/spreadsheets/u/0/ >/dev/null 2>&1 &'

# Messaging
alias slack='nohup slack >/dev/null 2>&1 &'
alias messenger='nohup google-chrome --app=https://www.messenger.com >/dev/null 2>&1 &'
alias whatsapp='nohup google-chrome --app=https://web.whatsapp.com >/dev/null 2>&1 &'
alias sms='nohup google-chrome --app=https://messages.android.com >/dev/null 2>&1 &'

# Paper hunting
alias paperpile='nohup google-chrome --app=https://www.paperpile.com/app >/dev/null 2>&1 &'
alias scholar='nohup google-chrome --app=https://scholar.google.com >/dev/null 2>&1 &'

alias tb='cd /home/hugo/Documents/PDFs/textbooks'
evince () {nohup /usr/bin/evince $* &}
# zathura () {nohup /usr/bin/zathura $* &}
alias workout='libreoffice Documents/perso/workout.ods >/dev/null 2>&1 &'

alias ucdvpn='/usr/local/pulse/PulseClient_x86_64.sh -h vpn.library.ucdavis.edu -u hmailhot -r Library'
alias we='curl http://wttr.in/sacramento'
alias ipaddr="awk '{print $2}' <(ifconfig wlp58s0 | grep 'inet');"
alias corenlp_server_start='java -mx4g -cp "$CORENLP_HOME/*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer -props StanfordCoreNLP-spanish.properties -strict'


#########################
#### Daily workflow #####
#########################
alias journal='cd ~/journal'
alias today="/usr/local/bin/today.sh"
alias yesterday="/usr/local/bin/yesterday.sh"
alias todo="/usr/local/bin/todo.sh"


########################
### Delphia workflow ###
########################
alias delmail="nohup google-chrome --app=https://mail.google.com/mail/u/1/#inbox >/dev/null 2>&1 &"
alias delcal="nohup google-chrome --app=https://calendar.google.com/calendar/b/1/r >/dev/null 2>&1 &"
alias deldrive="nohup google-chrome --app=https://drive.google.com/drive/u/3/my-drive >/dev/null 2>&1 &"
alias awsconsole="nohup google-chrome --app='https://console.aws.amazon.com/console/home' >/dev/null 2>&1 &"


#########################
###### SSH servers ######
#########################
alias mars='ssh mars.ece.ucdavis.edu'
alias cq='ssh hugovpl@colosse.calculquebec.ca'
alias datasci='ssh hmailhot@datasci.library.ucdavis.edu'

###############################
#### Data science workflow ####
###############################
alias cookieds='cookiecutter https://github.com/drivendata/cookiecutter-data-science'
alias psh='pipenv shell'
alias gs='git status'

#####################
#### Media Stuff ####
#####################
compress_videos () {docker run -v $*:/files bennetimo/shrinkwrap:latest \
    --input-extension MP4 --ffmpeg-opts crf=23, preset=veryfast  --preset gopro7 /files}
