#version 400

layout (location = 0) in vec3 pos;
layout (location = 1) in vec3 normals;
layout (location = 2) in vec2 texCoord;

out vec2 textureCoord;
out vec3 norm;
out vec3 fragPos;

uniform mat4 MVP;
uniform mat4 model;

void main()
{
	vec3 cPos=pos;
	//cPos.y=pos.y + 2 * 5 * pow((1/2*(1+sin(dot(vec2(2,2),vec2(pos.x,pos.z))*5))),2);
	cPos.y = pos.y + 2 * 1 *pow((sin(dot(vec2(1,1),vec2(pos.x, pos.z))*1)+1)/1,1); //aici schimbi forma terenului
	textureCoord = texCoord;
	fragPos = vec3(model * vec4(cPos, 1.0f));
	norm = mat3(transpose(inverse(model)))*normals;
	gl_Position = MVP * vec4(cPos, 1.0f);

	
}