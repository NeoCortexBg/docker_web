        if [[ -z "$1" ]]; then
                echo "Name in start_container not set"
                exit 1
        fi

        if [[ -z "$2" ]]; then
                echo "Image in start_container not set"
                exit 1
        fi

	CMD=$3
        if [[ -z "$CMD" ]]; then
		CMD="bash"
        fi

	docker \
        	run \
	        -d \
        	-it \
	        -v /projects:/projects \
		--net=bridge1 \
	        --name=$1 \
	        --hostname=$1.docker \
		--net-alias=$1.docker \
	        $2 \
	        $CMD

