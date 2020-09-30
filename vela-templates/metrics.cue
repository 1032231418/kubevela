data: {
	apiVersion: "standard.oam.dev/v1alpha1"
	kind:       "MetricsTrait"
	spec: {
		scrapeService: parameter
	}
}
#metrics: {
	// +usage=format of the metrics, default as prometheus
	// +short=f
	format:  *"prometheus" | string
	path:    *"/metrics" | string
	scheme:  *"http" | string
	enabled: *true | bool
	port:    *8080 | >=1024 & <=65535 & int
	// +usage= the label selector for the pods, default is the workload labels
	selector?: [string]: string
}

parameter: #metrics
// below is a sample value
parameter: {
	path: "/newport"
	port: 13622
	selector: {
		"app/type":    "OAM"
		"app/version": "v2"
	}
}
