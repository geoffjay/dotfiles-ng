import os,json,logging,notify2,socket
from slacker import Slacker
from time import sleep

tokenfile = "~/.slacktoken"
token = open(os.path.expanduser(tokenfile), 'r').read().strip('\n')

logging.basicConfig(level=logging.DEBUG)
log = logging.getLogger()

slack = Slacker(token)

def get_channels():
    """
    Return list of channel ids user belongs to
    """
    r = slack.channels.list().body
    return [ c for c in r['channels'] if c['is_member'] ]

def get_unread(channel_id):
    r = slack.channels.info(channel_id).body['channel']
    log.debug('checked unread messages for channel %s : %s' % \
              (r['name'], r['id']))
    try:
        return r['channel']['unread_count']
    except KeyError:
        return False

def main():
    while True:
        for c in get_channels():
            unread = get_unread(c['id'])
            if unread:
                notifier = notify2.init('slack notify')
                summary = c['name']
                msg = "%s unread messages" % unread
                n = notify2.Notification(
                    summary, msg, "notification-message-im")
                log.info('notification performed for channel %s' % \
                          (c['name']))
        sleep(15)

if __name__ == '__main__':
    main()
