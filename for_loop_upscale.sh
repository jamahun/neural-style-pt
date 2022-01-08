# Define the location of your style and content images
STYLE_IMAGE=./examples/inputs/brad_pitt.jpg
CONTENT_IMAGE=./examples/inputs/brad_pitt.jpg

# Adjust the parameters below to change the qualities of the ouputs
STYLE_WEIGHT=5e2 #How much to weight the style reconstruction term. Default is 1e2.
STYLE_SCALE=1 #Scale at which to extract features from the style image. Default is 1.0.
STYLE_BLEND_WEIGHTS=10 #The weight for blending the style of multiple style images, as a comma-separated list. The order of weights relates to the STYLE_IMAGE parameter
STYLE_WEIGHT2=2500 # Style weight for image size 2048 and above
CONTENT_WEIGHT=0 #This is the texture synthesis parameter
ORIGINAL_COLORS=0 #If you set this to 1, then the output image will keep the colors of the content image. Default is 0
TV_WEIGHT=0 #1e-3 is default

PYTHON=python3 # Change to Python if using Python 2
SCRIPT=neural_style.py
GPU=0

NEURAL_STYLE=$PYTHON
NEURAL_STYLE+=" "
NEURAL_STYLE+=$SCRIPT

# Uncomment if using pip package
#NEURAL_STYLE=neural-style


$NEURAL_STYLE \
  -content_image $CONTENT_IMAGE \
  -content_weight $CONTENT_WEIGHT \
  -tv_weight $TV_WEIGHT \
  -style_image $STYLE_IMAGE \
  -style_scale $STYLE_SCALE \
  -original_colors $ORIGINAL_COLORS \
  -style_blend_weights $STYLE_BLEND_WEIGHTS \
  -print_iter 1 \
  -style_weight $STYLE_WEIGHT \
  -image_size 256 \
  -output_image out1.png \
  -gpu $GPU \
  -backend cudnn -cudnn_autotune

$NEURAL_STYLE \
  -content_image $CONTENT_IMAGE \
  -content_weight $CONTENT_WEIGHT \
  -tv_weight $TV_WEIGHT \
  -style_image $STYLE_IMAGE \
  -init image -init_image out1.png \
  -style_scale $STYLE_SCALE \
  -original_colors $ORIGINAL_COLORS \
  -style_blend_weights $STYLE_BLEND_WEIGHTS \
  -print_iter 1 \
  -style_weight $STYLE_WEIGHT \
  -image_size 512 \
  -num_iterations 500 \
  -output_image out2.png \
  -gpu $GPU \
  -backend cudnn -cudnn_autotune

$NEURAL_STYLE \
  -content_image $CONTENT_IMAGE \
  -content_weight $CONTENT_WEIGHT \
  -tv_weight $TV_WEIGHT \
  -style_image $STYLE_IMAGE \
  -init image -init_image out2.png \
  -style_scale $STYLE_SCALE \
  -original_colors $ORIGINAL_COLORS \
  -style_blend_weights $STYLE_BLEND_WEIGHTS \
  -print_iter 1 \
  -style_weight $STYLE_WEIGHT \
  -image_size 1024 \
  -num_iterations 200 \
  -output_image out3.png \
  -gpu $GPU \
  -backend cudnn -cudnn_autotune

$NEURAL_STYLE \
  -content_image $CONTENT_IMAGE \
  -content_weight $CONTENT_WEIGHT \
  -tv_weight $TV_WEIGHT \
  -style_image $STYLE_IMAGE \
  -init image -init_image out3.png \
  -style_scale $STYLE_SCALE \
  -original_colors $ORIGINAL_COLORS \
  -style_blend_weights $STYLE_BLEND_WEIGHTS \
  -print_iter 1 \
  -style_weight $STYLE_WEIGHT2 \
  -image_size 2048 \
  -num_iterations 200 \
  -output_image out4.png \
  -gpu $GPU \
  -backend cudnn

$NEURAL_STYLE \
  -content_image $CONTENT_IMAGE \
  -content_weight $CONTENT_WEIGHT \
  -tv_weight $TV_WEIGHT \
  -style_image $STYLE_IMAGE \
  -init image -init_image out4.png \
  -style_scale $STYLE_SCALE \
  -original_colors $ORIGINAL_COLORS \
  -style_blend_weights $STYLE_BLEND_WEIGHTS \
  -print_iter 1 \
  -style_weight $STYLE_WEIGHT2 \
  -image_size 2600 \
  -num_iterations 200 \
  -output_image  out5.png \
  -gpu $GPU \
  -backend cudnn -optimizer adam
