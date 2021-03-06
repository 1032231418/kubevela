data: {
	apiVersion: "v1"
	kind:       "Job"
	metadata: name: parameter.name
	spec: {
		parallelism: parameter.count
		completions: parameter.count
		template:
			spec:
				containers: [{
					image: parameter.image
					name:  parameter.name
					ports: [{
						containerPort: parameter.port
						protocol:      "TCP"
						name:          "default"
					}]
				}]
	}
}
#task: {
	// +usage=specify number of tasks to run in parallel
	// +short=c
	count: *1 | int
	name:  string
	// +usage=specify app image
	// +short=i
	image: string
	// +usage=specify port for container
	// +short=p
	port: *6379 | int
}
parameter: #task
