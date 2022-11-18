# # Create a lunch template
# resource "aws_placement_group" "eng13_aneese_tf_pg" {
#   name     = "eng13_aneese_tf_pg"
#   strategy = "cluster"
# }

# # Create a lunch template
# resource "aws_launch_template" "as_launch_template_tf" {
#   name          = "eng130-aneese-tf-lc"
#   image_id      = var.aws_ubuntu_18_04
#   instance_type = "t2.micro"
#   key_name      = var.aws_key_name
#   lifecycle {
#     create_before_destroy = true
#   }
# }


# # Create an Auto Scaling Group
# resource "aws_autoscaling_group" "eng130_aneese_tf_asg" {
#   name                      = "aneese-tf-asg"
#   max_size                  = 3
#   min_size                  = 1
#   health_check_grace_period = 300
#   health_check_type         = "ELB"
#   desired_capacity          = 1
#   force_delete              = true
#   placement_group           = aws_placement_group.eng13_aneese_tf_pg.id
#   launch_configuration      = aws_launch_template.as_launch_template_tf.name
#   vpc_zone_identifier       = [aws_subnet.eng130_aneese_tf_subnet.id]
#     tag {
#         key                 = "aneese-tf-asg"
#         value               = "eng130_aneese_tf_asg"
#         propagate_at_launch = true
#     }
# }