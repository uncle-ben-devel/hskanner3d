{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2019.2.0",
        "fileVersion": "1.1",
        "nodesVersions": {
            "CameraInit": "2.0",
            "ConvertSfMFormat": "2.0",
            "Publish": "1.1",
            "StructureFromMotion": "2.0",
            "FeatureExtraction": "1.1",
            "ImageMatching": "1.0",
            "FeatureMatching": "2.0"
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
                "size": 0,
                "split": 1
            },
            "uids": {
                "0": "0eea3dfc40ea19d83d98599a56e25e3e2d7cf7ca"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "viewpoints": [],
                "intrinsics": [
                    {
                        "intrinsicId": 1709083539,
                        "pxInitialFocalLength": -1.0,
                        "pxFocalLength": 2477.769717528438,
                        "type": "fisheye4",
                        "width": 3280,
                        "height": 2464,
                        "serialNumber": "/home/hskanner3d-dev/Documents/meshroom-workspace/kopftest0/31-Aug-2020-16:45:23_RaspberryPi_RP_imx219",
                        "principalPoint": {
                            "x": 1640.0,
                            "y": 1232.0
                        },
                        "initializationMode": "unknown",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0,
                            0.0
                        ],
                        "locked": false
                    },
                    {
                        "intrinsicId": 3186566950,
                        "pxInitialFocalLength": -1.0,
                        "pxFocalLength": 2477.769717528438,
                        "type": "fisheye4",
                        "width": 3280,
                        "height": 2464,
                        "serialNumber": "/home/hskanner3d-dev/Documents/meshroom-workspace/steintest0/31-Aug-2020-16:24:34_RaspberryPi_RP_imx219",
                        "principalPoint": {
                            "x": 1640.0,
                            "y": 1232.0
                        },
                        "initializationMode": "unknown",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0,
                            0.0
                        ],
                        "locked": false
                    },
                    {
                        "intrinsicId": 3570249406,
                        "pxInitialFocalLength": -1.0,
                        "pxFocalLength": 2477.769717528438,
                        "type": "fisheye4",
                        "width": 3280,
                        "height": 2464,
                        "serialNumber": "/home/hskanner3d-dev/Pictures/03-Sep-2020-15:23:56_RaspberryPi_RP_imx219",
                        "principalPoint": {
                            "x": 1640.0,
                            "y": 1232.0
                        },
                        "initializationMode": "unknown",
                        "distortionParams": [
                            0.0,
                            0.0,
                            0.0,
                            0.0
                        ],
                        "locked": false
                    }
                ],
                "sensorDatabase": "/home/hskanner3d-dev/Documents/software/Meshroom-2019.2.0-linux/Meshroom-2019.2.0/aliceVision/share/aliceVision/cameraSensors.db",
                "defaultFieldOfView": 67.0,
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
                "size": 0,
                "split": 0
            },
            "uids": {
                "0": "72828bb158680150728046e3ef5c6e29f0cc010c"
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
                "size": 0,
                "split": 1
            },
            "uids": {
                "0": "95635db330bd2c20112f3f00a4fab55ea13e7647"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{FeatureExtraction_1.input}",
                "featuresFolders": [
                    "{FeatureExtraction_1.output}"
                ],
                "tree": "/home/hskanner3d-dev/Documents/software/Meshroom-2019.2.0-linux/Meshroom-2019.2.0/aliceVision/share/aliceVision/vlfeat_K80L3.SIFT.tree",
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
                467,
                1
            ],
            "parallelization": {
                "blockSize": 20,
                "size": 0,
                "split": 0
            },
            "uids": {
                "0": "0a4feeddcdecb270ab0e2cf3d5bd44cf002f43cb"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{ImageMatching_1.input}",
                "featuresFolders": "{ImageMatching_1.featuresFolders}",
                "imagePairsList": "{ImageMatching_1.output}",
                "describerTypes": [
                    "sift",
                    "akaze"
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
                647,
                -1
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 0,
                "split": 1
            },
            "uids": {
                "0": "59dfb678bc2ef0127790c620e7612de989210aa5"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{FeatureMatching_1.input}",
                "featuresFolders": "{FeatureMatching_1.featuresFolders}",
                "matchesFolders": [
                    "{FeatureMatching_1.output}"
                ],
                "describerTypes": [
                    "sift",
                    "akaze"
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
                "interFileExtension": ".ply",
                "verboseLevel": "debug"
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/sfm.abc",
                "outputViewsAndPoses": "{cache}/{nodeType}/{uid0}/cameras.sfm",
                "extraInfoFolder": "{cache}/{nodeType}/{uid0}/"
            }
        },
        "Publish_1": {
            "nodeType": "Publish",
            "position": [
                1125,
                -3
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 3,
                "split": 1
            },
            "uids": {
                "0": "3d09b51331e29205406ea345bcc8b97ab9f7b607"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "inputFiles": [
                    "",
                    "",
                    "{ConvertSfMFormat_1.output}"
                ],
                "output": ""
            },
            "outputs": {}
        },
        "ConvertSfMFormat_1": {
            "nodeType": "ConvertSfMFormat",
            "position": [
                869,
                -2
            ],
            "parallelization": {
                "blockSize": 0,
                "size": 0,
                "split": 1
            },
            "uids": {
                "0": "657d21e36ac4789c0b945080be0c06cd4251c874"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{StructureFromMotion_1.output}",
                "fileExt": "ply",
                "describerTypes": [
                    "sift",
                    "akaze"
                ],
                "imageWhiteList": [],
                "views": true,
                "intrinsics": true,
                "extrinsics": true,
                "structure": true,
                "observations": true,
                "verboseLevel": "info"
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/sfm.{fileExtValue}"
            }
        }
    }
}