# Creates a component from a simple template
# Of the form:
# component_name:
#   component_name.tsx
#   index.ts

# If no arguments are passed, print usage
if [ $# -eq 0 ]; then
  echo "Usage: makeComponent.sh <path>/<component_name>"
  exit 1
fi

COMPONENT_PATH=$1

mkdir $COMPONENT_PATH

# Grab name of tail of path
COMPONENT_NAME=$(basename $COMPONENT_PATH)


# Create component file and index file
touch $COMPONENT_PATH/$COMPONENT_NAME.tsx
touch $COMPONENT_PATH/index.ts

# Create templates

COMPONENT_TEMPLATE="\n/** Interfaces/types */\n\n/** components */\n\ninterface I${COMPONENT_NAME}Props {}\n\nconst ${COMPONENT_NAME} = ({}: I${COMPONENT_NAME}Props) => {\nreturn null;\n}\n\nexport default ${COMPONENT_NAME};\n"
INDEX_TEMPLATE="export { default } from \"./${COMPONENT_NAME}\""


# Fill component with template
echo $COMPONENT_TEMPLATE > ./${COMPONENT_PATH}/${COMPONENT_NAME}.tsx
echo $INDEX_TEMPLATE > ./${COMPONENT_PATH}/index.ts