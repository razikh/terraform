variable "from_port" {
	description = "this is from port"
	type =	number
	default = 8070
}

variable "to_port" {
	description = "this is from port"
	type =	number
	default = 8070
}

variables "protocol" {
	description = "transport level protocol"
	type = string
	default = "tcp"
}

