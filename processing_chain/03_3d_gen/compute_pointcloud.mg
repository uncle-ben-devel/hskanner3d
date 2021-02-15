{
    "header": {
        "pipelineVersion": "2.2",
        "releaseVersion": "2020.1.0",
        "fileVersion": "1.1",
        "nodesVersions": {
            "FeatureExtraction": "1.1",
            "StructureFromMotion": "2.0",
            "ImageMatching": "2.0",
            "ConvertSfMFormat": "2.0",
            "CameraInit": "3.0",
            "FeatureMatching": "2.0",
            "Publish": "1.2"
        }
    },
    "graph": {
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
                "0": "bc6063c79515b82be391c02f0343f0f86942498a"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{StructureFromMotion_1.output}",
                "fileExt": "ply",
                "describerTypes": [
                    "sift"
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
                "0": "37b4a6e10ac327d598304896653df04b8a970e77"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "inputFiles": [
                    "",
                    "",
                    "{ConvertSfMFormat_1.output}"
                ],
                "output": "",
                "verboseLevel": "info"
            },
            "outputs": {}
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
                "0": "b4ea46a3431e255d4576144c4b9247e2b4d769b0"
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
                "observationConstraint": "Basic",
                "localizerEstimatorMaxIterations": 4096,
                "localizerEstimatorError": 0.0,
                "lockScenePreviouslyReconstructed": false,
                "useLocalBA": true,
                "localBAGraphDistance": 1,
                "maxNumberOfMatches": 0,
                "minNumberOfMatches": 0,
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
                "filterTrackForks": false,
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
                "0": "50df8802f551d6b3a034a30b6c8334224cfce307"
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
                "knownPosesGeometricErrorMax": 5.0,
                "maxMatches": 0,
                "savePutativeMatches": false,
                "guidedMatching": true,
                "matchFromKnownCameraPoses": false,
                "exportDebugFiles": false,
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
                "0": "502c3e5d0c1f42b9b2f85e56888fdeb3e5cd8fcf"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{FeatureExtraction_1.input}",
                "featuresFolders": [
                    "{FeatureExtraction_1.output}"
                ],
                "method": "VocabularyTree",
                "tree": "/home/hskanner3d-dev/Documents/software/Meshroom-2019.2.0-linux/Meshroom-2019.2.0/aliceVision/share/aliceVision/vlfeat_K80L3.SIFT.tree",
                "weights": "",
                "minNbImages": 200,
                "maxDescriptors": 500,
                "nbMatches": 50,
                "nbNeighbors": 50,
                "verboseLevel": "info"
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/imageMatches.txt"
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
                "0": "540bab00d8ec68a7cf1517df92940104b3ca7328"
            },
            "internalFolder": "{cache}/{nodeType}/{uid0}/",
            "inputs": {
                "input": "{CameraInit_1.output}",
                "describerTypes": [
                    "sift"
                ],
                "describerPreset": "normal",
                "forceCpuExtraction": true,
                "maxThreads": 0,
                "verboseLevel": "info"
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/"
            }
        },
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
                "0": "30977e9335e6f06c08c9a6aef89fc5a219aa710f"
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
                        "sensorWidth": 36,
                        "sensorHeight": 24,
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
                        "sensorWidth": 36,
                        "sensorHeight": 24,
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
                        "sensorWidth": 36,
                        "sensorHeight": 24,
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
                "defaultFieldOfView": 79.0,
                "groupCameraFallback": "folder",
                "allowedCameraModels": [
                    "pinhole",
                    "radial1",
                    "radial3",
                    "brown",
                    "fisheye4",
                    "fisheye1"
                ],
                "viewIdMethod": "metadata",
                "viewIdRegex": ".*?(\\d+)",
                "verboseLevel": "info"
            },
            "outputs": {
                "output": "{cache}/{nodeType}/{uid0}/cameraInit.sfm"
            }
        }
    }
}