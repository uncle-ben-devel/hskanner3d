{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2019.2.0",
        "fileVersion": "1.1",
        "nodesVersions": {
            "MeshFiltering": "2.0",
            "FeatureMatching": "2.0",
            "Texturing": "5.0",
            "ImageMatching": "1.0",
            "DepthMapFilter": "3.0",
            "MeshDecimate": "1.0",
            "CameraInit": "2.0",
            "PrepareDenseScene": "3.0",
            "MeshDenoising": "1.0",
            "FeatureExtraction": "1.1",
            "DepthMap": "2.0",
            "Meshing": "3.0",
            "StructureFromMotion": "2.0"
        }
    },
    "graph": {
        "CameraInit_1": {
            "nodeType": "CameraInit",
            "position": [
                0,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 45,
                "split": 1
            },
            "uids": {
                "0": "6a4b8759ff630fc0a326e43d4a6a945946da48f2"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "viewpoints": [
                    {
                        "viewId": 9824167,
                        "poseId": 9824167,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_bb.004.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 16737065,
                        "poseId": 16737065,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_hb.001.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 18860792,
                        "poseId": 18860792,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_mt.004.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 50127534,
                        "poseId": 50127534,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_t.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 69754522,
                        "poseId": 69754522,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_b.008.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 77760696,
                        "poseId": 77760696,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_mb.005.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 300692385,
                        "poseId": 300692385,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_t.002.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 367447628,
                        "poseId": 367447628,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_bb.008.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 384342986,
                        "poseId": 384342986,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_b.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 448964408,
                        "poseId": 448964408,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_bb.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 452022785,
                        "poseId": 452022785,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_tt.003.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 459563810,
                        "poseId": 459563810,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_b.001.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 464924407,
                        "poseId": 464924407,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_bb.005.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 494987865,
                        "poseId": 494987865,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_hb.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 515362076,
                        "poseId": 515362076,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_bb.007.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 571322135,
                        "poseId": 571322135,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_hb.008.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 607924778,
                        "poseId": 607924778,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_t.007.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 708885029,
                        "poseId": 708885029,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_m.008.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 722564067,
                        "poseId": 722564067,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_m.007.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 740977974,
                        "poseId": 740977974,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_m.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 785652541,
                        "poseId": 785652541,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_b.002.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 800748633,
                        "poseId": 800748633,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_tt.002.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 809005701,
                        "poseId": 809005701,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_mt.006.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 921597562,
                        "poseId": 921597562,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_bb.006.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 989440845,
                        "poseId": 989440845,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_ht.001.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 1026608606,
                        "poseId": 1026608606,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_mb.004.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 1031549141,
                        "poseId": 1031549141,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_mb.006.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 1043134668,
                        "poseId": 1043134668,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_tt.008.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 1052433887,
                        "poseId": 1052433887,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_tt.004.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 1178868828,
                        "poseId": 1178868828,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_tt.007.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 1208076542,
                        "poseId": 1208076542,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_mt.005.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 1370731954,
                        "poseId": 1370731954,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_tt.006.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 1452913844,
                        "poseId": 1452913844,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_mb.003.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 1465437392,
                        "poseId": 1465437392,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_tt.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 1613653275,
                        "poseId": 1613653275,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_ht.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 1656317180,
                        "poseId": 1656317180,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_m.002.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 1657795592,
                        "poseId": 1657795592,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_tt.001.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 1686204387,
                        "poseId": 1686204387,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_m.001.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 1858691645,
                        "poseId": 1858691645,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_ht.008.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 1899098848,
                        "poseId": 1899098848,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_bb.001.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 1964899695,
                        "poseId": 1964899695,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_tt.005.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 1991580191,
                        "poseId": 1991580191,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_bb.002.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 2025919562,
                        "poseId": 2025919562,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_mt.003.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 2098441778,
                        "poseId": 2098441778,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_b.007.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    },
                    {
                        "viewId": 2105442953,
                        "poseId": 2105442953,
                        "path": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box/0001_bb.003.png",
                        "intrinsicId": 1111549667,
                        "rigId": -1,
                        "subPoseId": -1,
                        "metadata": "{\"Camera\": \"Camera_tt.008\", \"Date\": \"2020/09/28 19:18:36\", \"File\": \"C:\\\\Users\\\\Solaris\\\\Documents\\\\workspace_ssd\\\\hskanner3d_dev_folder\\\\20_position_estimation\\\\hskanner3d_position_simulation_circle_9T_custom_heightmod.blend\", \"Frame\": \"1\", \"Lens\": \"1.67\", \"RenderTime\": \"07:04:43.16\", \"ResolutionUnit\": \"inch\", \"Scene\": \"Scene\", \"Time\": \"00:00:00:01\", \"XResolution\": \"72.009\", \"YResolution\": \"72.009\", \"cycles\": {\"RenderLayer\": {\"render_time\": \"08:59.82\", \"samples\": \"1024\", \"synchronization_time\": \"06:55:27.37\", \"total_time\": \"07:04:27.19\"}}}"
                    }
                ],
                "intrinsics": [
                    {
                        "intrinsicId": 1111549667,
                        "pxInitialFocalLength": -1.0,
                        "pxFocalLength": 1989.4790867124098,
                        "type": "radial3",
                        "width": 2464,
                        "height": 3280,
                        "serialNumber": "C:/Users/Solaris/Documents/workspace_ssd/hskanner3d_dev_folder/20_position_estimation/render/cauc-stand-nohair-box",
                        "principalPoint": {
                            "x": 1232.0,
                            "y": 1640.0
                        },
                        "initializationMode": "unknown",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0
                        ],
                        "locked": false
                    }
                ],
                "sensorDatabase": "C:/Users/Solaris/Documents/programme/Meshroom-2019.2.0/aliceVision/share/aliceVision/cameraSensors.db",
                "defaultFieldOfView": 79.0,
                "groupCameraFallback": "folder",
                "verboseLevel": "info"
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/cameraInit.sfm"
            }
        },
        "FeatureExtraction_1": {
            "nodeType": "FeatureExtraction",
            "position": [
                155,
                0
            ],
            "parallelization": {
                "blockSize": 40,
                "size": 45,
                "split": 2
            },
            "uids": {
                "0": "595e87145c78d7375cfefcbfb5f96d02dad10a15"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{CameraInit_1.output}",
                "describerTypes": [
                    "sift",
                    "akaze"
                ],
                "describerPreset": "high",
                "forceCpuExtraction": true,
                "verboseLevel": "info"
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/"
            }
        },
        "ImageMatching_1": {
            "nodeType": "ImageMatching",
            "position": [
                310,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 45,
                "split": 1
            },
            "uids": {
                "0": "269c8ff7ee1c0e9a3ba118e76bf5f953ac156638"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{FeatureExtraction_1.input}",
                "featuresFolders": [
                    "{FeatureExtraction_1.output}"
                ],
                "tree": "C:/Users/Solaris/Documents/programme/Meshroom-2019.2.0/aliceVision/share/aliceVision/vlfeat_K80L3.SIFT.tree",
                "weights": "",
                "minNbImages": 200,
                "maxDescriptors": 500,
                "nbMatches": 50,
                "verboseLevel": "info"
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/imageMatches.txt"
            }
        },
        "FeatureMatching_1": {
            "nodeType": "FeatureMatching",
            "position": [
                465,
                0
            ],
            "parallelization": {
                "blockSize": 20,
                "size": 45,
                "split": 3
            },
            "uids": {
                "0": "43a3836f1f462f8449666ee9811fb19b51229230"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{ImageMatching_1.input}",
                "featuresFolders": "{ImageMatching_1.featuresFolders}",
                "imagePairsList": "{ImageMatching_1.output}",
                "describerTypes": [
                    "sift"
                ],
                "photometricMatchingMethod": "ANN_L2",
                "geometricEstimator": "acransac",
                "geometricFilterType": "fundamental_matrix",
                "distanceRatio": 0.8,
                "maxIteration": 2048,
                "geometricError": 0.0,
                "maxMatches": 0,
                "savePutativeMatches": false,
                "guidedMatching": true,
                "exportDebugFiles": false,
                "verboseLevel": "info"
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/"
            }
        },
        "StructureFromMotion_1": {
            "nodeType": "StructureFromMotion",
            "position": [
                620,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 45,
                "split": 1
            },
            "uids": {
                "0": "3091f85b4b5e52a4be8135d9836cdff2c8e01656"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{FeatureMatching_1.input}",
                "featuresFolders": "{FeatureMatching_1.featuresFolders}",
                "matchesFolders": [
                    "{FeatureMatching_1.output}"
                ],
                "describerTypes": [
                    "sift"
                ],
                "localizerEstimator": "acransac",
                "localizerEstimatorMaxIterations": 4096,
                "localizerEstimatorError": 0.0,
                "lockScenePreviouslyReconstructed": false,
                "useLocalBA": true,
                "localBAGraphDistance": 1,
                "maxNumberOfMatches": 0,
                "minInputTrackLength": 2,
                "minNumberOfObservationsForTriangulation": 2,
                "minAngleForTriangulation": 3.0,
                "minAngleForLandmark": 2.0,
                "maxReprojectionError": 4.0,
                "minAngleInitialPair": 5.0,
                "maxAngleInitialPair": 40.0,
                "useOnlyMatchesFromInputFolder": false,
                "useRigConstraint": true,
                "lockAllIntrinsics": false,
                "initialPairA": "",
                "initialPairB": "",
                "interFileExtension": ".abc",
                "verboseLevel": "info"
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/sfm.abc",
                "outputViewsAndPoses": "{cache}/{nodeType}/{uid0}/cameras.sfm",
                "extraInfoFolder": "{cache}/{nodeType}/{uid0}/"
            }
        },
        "PrepareDenseScene_1": {
            "nodeType": "PrepareDenseScene",
            "position": [
                775,
                0
            ],
            "parallelization": {
                "blockSize": 40,
                "size": 45,
                "split": 2
            },
            "uids": {
                "0": "949fead9a13e4c1463ab152e21681fc95038fc75"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{StructureFromMotion_1.output}",
                "imagesFolders": [],
                "outputFileType": "exr",
                "saveMetadata": true,
                "saveMatricesTxtFiles": false,
                "evCorrection": false,
                "verboseLevel": "info"
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "outputUndistorted": "{cache}/{nodeType}/{uid0}/*.{outputFileTypeValue}"
            }
        },
        "DepthMap_1": {
            "nodeType": "DepthMap",
            "position": [
                930,
                0
            ],
            "parallelization": {
                "blockSize": 3,
                "size": 45,
                "split": 15
            },
            "uids": {
                "0": "5ef078be417822abe0fe9b5c96cd40c63166a6a2"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{PrepareDenseScene_1.input}",
                "imagesFolder": "{PrepareDenseScene_1.output}",
                "downscale": 1,
                "minViewAngle": 2.0,
                "maxViewAngle": 70.0,
                "sgmMaxTCams": 10,
                "sgmWSH": 4,
                "sgmGammaC": 5.5,
                "sgmGammaP": 8.0,
                "refineMaxTCams": 6,
                "refineNSamplesHalf": 150,
                "refineNDepthsToRefine": 31,
                "refineNiters": 100,
                "refineWSH": 3,
                "refineSigma": 15,
                "refineGammaC": 15.5,
                "refineGammaP": 8.0,
                "refineUseTcOrRcPixSize": false,
                "exportIntermediateResults": false,
                "nbGPUs": 0,
                "verboseLevel": "info"
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/"
            }
        },
        "DepthMapFilter_1": {
            "nodeType": "DepthMapFilter",
            "position": [
                1085,
                0
            ],
            "parallelization": {
                "blockSize": 10,
                "size": 45,
                "split": 5
            },
            "uids": {
                "0": "911c1249f281890b0a563d854650e671b03bb24b"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{DepthMap_1.input}",
                "depthMapsFolder": "{DepthMap_1.output}",
                "minViewAngle": 2.0,
                "maxViewAngle": 70.0,
                "nNearestCams": 10,
                "minNumOfConsistentCams": 3,
                "minNumOfConsistentCamsWithLowSimilarity": 4,
                "pixSizeBall": 0,
                "pixSizeBallWithLowSimilarity": 0,
                "computeNormalMaps": false,
                "verboseLevel": "info"
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/"
            }
        },
        "Meshing_1": {
            "nodeType": "Meshing",
            "position": [
                1240,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "e6262089f42b7ba012f57227548dd1da5558fe1e"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{DepthMapFilter_1.input}",
                "depthMapsFolder": "{DepthMapFilter_1.depthMapsFolder}",
                "depthMapsFilterFolder": "{DepthMapFilter_1.output}",
                "estimateSpaceFromSfM": true,
                "estimateSpaceMinObservations": 3,
                "estimateSpaceMinObservationAngle": 10,
                "maxInputPoints": 50000000,
                "maxPoints": 5000000,
                "maxPointsPerVoxel": 1000000,
                "minStep": 2,
                "partitioning": "singleBlock",
                "repartition": "multiResolution",
                "angleFactor": 15.0,
                "simFactor": 15.0,
                "pixSizeMarginInitCoef": 2.0,
                "pixSizeMarginFinalCoef": 4.0,
                "voteMarginFactor": 4.0,
                "contributeMarginFactor": 2.0,
                "simGaussianSizeInit": 10.0,
                "simGaussianSize": 10.0,
                "minAngleThreshold": 1.0,
                "refineFuse": true,
                "addLandmarksToTheDensePointCloud": true,
                "colorizeOutput": false,
                "saveRawDensePointCloud": false,
                "verboseLevel": "info"
            },
            "outputs": {
                "outputMesh": "{cache}/{nodeType}/{uid0}/mesh.obj",
                "output": "{cache}/{nodeType}/{uid0}/densePointCloud.abc"
            }
        },
        "MeshFiltering_1": {
            "nodeType": "MeshFiltering",
            "position": [
                1395,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "b58bbcf32a7dfcb15d3277b2e519b7a16c8a53af"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "inputMesh": "{Meshing_1.outputMesh}",
                "removeLargeTrianglesFactor": 5.0,
                "keepLargestMeshOnly": true,
                "iterations": 0,
                "lambda": 1.0,
                "verboseLevel": "info"
            },
            "outputs": {
                "outputMesh": "{cache}/{nodeType}/{uid0}/mesh.obj"
            }
        },
        "Texturing_1": {
            "nodeType": "Texturing",
            "position": [
                1860,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "f01077293704d5e1ccfdb9f8bc309d60618d79ee"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{Meshing_1.output}",
                "imagesFolder": "{DepthMap_1.imagesFolder}",
                "inputMesh": "{MeshDecimate_1.output}",
                "textureSide": 8192,
                "downscale": 1,
                "outputTextureFileType": "png",
                "unwrapMethod": "Basic",
                "useUDIM": true,
                "fillHoles": false,
                "padding": 5,
                "correctEV": false,
                "useScore": true,
                "processColorspace": "sRGB",
                "multiBandDownscale": 4,
                "multiBandNbContrib": {
                    "high": 1,
                    "midHigh": 5,
                    "midLow": 10,
                    "low": 0
                },
                "bestScoreThreshold": 0.1,
                "angleHardThreshold": 90.0,
                "forceVisibleByAllVertices": false,
                "flipNormals": false,
                "visibilityRemappingMethod": "PullPush",
                "verboseLevel": "info"
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/",
                "outputMesh": "{cache}/{nodeType}/{uid0}/texturedMesh.obj",
                "outputMaterial": "{cache}/{nodeType}/{uid0}/texturedMesh.mtl",
                "outputTextures": "{cache}/{nodeType}/{uid0}/texture_*.{outputTextureFileTypeValue}"
            }
        },
        "MeshDenoising_1": {
            "nodeType": "MeshDenoising",
            "position": [
                1550,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "c42cf5f291be4731a823ed34d9b0133e0b3b83e7"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{MeshFiltering_1.outputMesh}",
                "denoisingIterations": 1,
                "meshUpdateClosenessWeight": 0.001,
                "lambda": 0.5,
                "eta": 1.5,
                "mu": 1.5,
                "nu": 0.3,
                "meshUpdateMethod": 0,
                "verboseLevel": "info"
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/mesh.obj"
            }
        },
        "MeshDecimate_1": {
            "nodeType": "MeshDecimate",
            "position": [
                1705,
                0
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 1,
                "split": 1
            },
            "uids": {
                "0": "a70f6e44075c8b6c37a834c3a64072a07321b7fc"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{MeshDenoising_1.output}",
                "simplificationFactor": 0.1,
                "nbVertices": 0,
                "minVertices": 0,
                "maxVertices": 0,
                "flipNormals": false,
                "verboseLevel": "info"
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/mesh.obj"
            }
        }
    }
}