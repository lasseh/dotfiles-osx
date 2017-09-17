exists() {
    for i in $*; do
        which $i >/dev/null 2>&1 || return 1
    done
    return 0
}

if exists ssh-agent; then
    if [[ -z $SSH_AUTH_SOCK ]]; then
        if [[ -f ~/.agent.env ]]; then
            . ~/.agent.env -s > /dev/null

            if ! kill -0 $SSH_AGENT_PID > /dev/null 2>&1; then
                ssh-agent -s > ~/.agent.env
                . ~/.agent.env > /dev/null 2>&1
            fi
        else
            ssh-agent -s > ~/.agent.env
            . ~/.agent.env > /dev/null 2>&1
        fi
    fi
fi

