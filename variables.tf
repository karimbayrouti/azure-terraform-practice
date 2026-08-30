variable "location" {
  description = "Azure region for all resources"
  type        = string
  default     = "Germany West Central"
}
variable "location2" {
  description = "Specific Azure region for resourcea"
  type        = string
  default     = "Italy North"
}
variable "environment" {
  description = "Environment tag applied to all resources"
  type        = string
  default     = "practice"
}

variable "owner" {
  description = "Owner tag applied to all resources"
  type        = string
  default     = "Karim"
} 