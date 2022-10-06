# Ça fait la job
## _d'envoyer des notifications_

Donc voici deux scripts louches pour mettre en place des notifs qui viennent d'irc en profitant du log, et en présumant que vous avez une connexion permanente dans tmux qui elle pointe sur irssi.

## Mise en place

Dans termux vous clonez / téléchargez ce repo, puis vous créer un fichier env qui décrit les chemins nécessaires:

Exemple de `.env`:
```
CONNECTION=user@remote
LOG=path/to/#channel.log
CHANN=#channel
NICK=user
TAGS=victwere,aaa,nick
```

Et finalement vous ajoutez un cronjob avec la fréquence désiré:

Exemple de `cronjob`:
```
* * * * * /path/to/ca-fait-la-job-notif/ircnotif.sh
```

## Oui mais termux?

Termux est sur le Play Store, mais c'est un mensonge, vous voulez [F-Droid](https://f-droid.org/en/).

Une fois F-Droid installé, vous pouvez trouver [Termux](https://f-droid.org/en/packages/com.termux/) et [Termux:API](https://f-droid.org/en/packages/com.termux.api/) sur le store.

Et une fois Termux installé, dans Termux vous allez aussi avoir besoin de [Termux-services](https://wiki.termux.com/wiki/Termux-services), de `cronie`, de `ssh`, et potentiellement de `git` (selon comment vous voulez télécharger les scripts ci-présents, par `wget` c'est probablement plus simple):
```
pkg install termux-services
pkg install cronie
pkg install openssh
pkg install git
```

## Oui mais les fuckings sons?

C'est l'entrée TAGS, vous pouvez l'omettre si vous n'avez pas de plézire, ou juste mettre "TAGS=nick" pour seulement se faire avertir quand quelqu'un vous tag.

## Oui mais c'est possible de rater des notifs vu que c'est pas continu et ça regarde juste les quelques derniers messages?

Pas mon problème.

## Oui mais irssi-dans-tmux ?

AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA

Merci d'être venu à mon TED Talk.

## Oui mais ce script est de la shit ?

Voir réponse précédente.

## Oui mais les accents sont tout chisés?

Voir réponse précédente.
