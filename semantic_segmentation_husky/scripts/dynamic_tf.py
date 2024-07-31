#!/usr/bin/env python3
import rospy
import tf2_ros
import tf_conversions
from geometry_msgs.msg import PoseStamped, TransformStamped



def pose_callback(pose_stamped):
    """
    Callback function that receives pose updates and broadcasts them.
    """
    transform = TransformStamped()
    broadcaster = tf2_ros.TransformBroadcaster()

    # Set the header information on the transform

    transform.header.stamp = pose_stamped.header.stamp
    transform.header.frame_id = 'world'
    transform.child_frame_id = 'semantic_segmentation_world'

    # Set the pose information on the transform
    transform.transform.translation.x = pose_stamped.pose.position.x
    transform.transform.translation.y = pose_stamped.pose.position.y
    transform.transform.translation.z = pose_stamped.pose.position.z
    transform.transform.rotation.x = pose_stamped.pose.orientation.x
    transform.transform.rotation.y = pose_stamped.pose.orientation.y
    transform.transform.rotation.z = pose_stamped.pose.orientation.z
    transform.transform.rotation.w = pose_stamped.pose.orientation.w

    # Broadcast the transform
    broadcaster.sendTransform(transform)

if __name__ == '__main__':
    
    
    rospy.init_node('dynamic_tf_broadcaster')
    rate = rospy.Rate(10.0)

    subscriber = rospy.Subscriber('/model/husky_seg_cam/pose', PoseStamped, pose_callback)

    rospy.spin()
