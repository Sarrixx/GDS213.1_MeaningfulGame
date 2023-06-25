// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Grunge/Grunge Surface Mask Texture"
{
	Properties
	{
		[Header(DEBUG SETTINGS)][Enum(Off,0,On,1)]_ZWriteMode("ZWrite Mode", Int) = 1
		[Enum(None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15)]_ColorMask("Color Mask Mode", Int) = 15
		[Header(GLOBAL SETTINGS)][Enum(UnityEngine.Rendering.CullMode)]_CullMode("Cull Mode", Int) = 0
		[Header(MAP MAIN TEXTURE)]_Color("Albedo Tint", Color) = (1,1,1,0)
		[Enum(Off,0,Active,1,Active Inverted,2)]_Gradient_Mode("Gradient Mode", Int) = 0
		[HDR]_Gradient_Top("Gradient Tint Top", Color) = (0.7259277,0.7647059,0.06185123,0)
		[HDR]_Gradient_TopSide("Gradient Tint Top Side", Color) = (0.2569204,0.5525266,0.7279412,0)
		[HDR]_Gradient_Bottom("Gradient Tint Bottom", Color) = (0.3877363,0.5955882,0.188311,0)
		[HDR]_Gradient_BottomSide("Gradient Tint Bottom Side", Color) = (0.7058823,0.2024221,0.2024221,0)
		[HDR]_Gradient_TintCurvature("Gradient Tint Curvature", Color) = (1,0,0.444931,0)
		_Gradient_Ramp("Gradient Ramp", Range( 0 , 1)) = 0
		_Gradient_Contrast("Gradient Contrast", Range( 0 , 1)) = 0
		_Gradient_Height("Gradient Height", Range( 0 , 20)) = 17.80307
		[SingleLineTexture]_MainTex("Albedo Map", 2D) = "white" {}
		_Brightness("Brightness", Range( 0 , 2)) = 1
		_TilingX("Tiling X", Float) = 1
		_TilingY("Tiling Y", Float) = 1
		_OffsetX("Offset X", Float) = 0
		_OffsetY("Offset Y", Float) = 0
		[Normal][SingleLineTexture]_BumpMap("Normal Map", 2D) = "bump" {}
		_NormalStrength("Normal Strength", Float) = 1
		[SingleLineTexture]_MetallicGlossMap("Metallic Map", 2D) = "white" {}
		_MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
		[SingleLineTexture]_OcclusionMap("Occlusion Map", 2D) = "white" {}
		[Enum(Texture,0,Baked,1)]_OcclusionSourceMode("Occlusion Source Mode", Int) = 1
		_OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0.5
		[SingleLineTexture]_SmoothnessMap("Smoothness Map", 2D) = "white" {}
		[Enum(Standard,0,Geometric,1,Texture,2)]_SmoothnessModeSurface("Smoothness Mode", Int) = 2
		[Enum(Smoothness,0,Roughness,1)]_SmoothnessType("Smoothness Type", Int) = 0
		_SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0.1
		_SmoothnessThreshold("Smoothness Threshold", Range( 0 , 0.5)) = 0
		_SmoothnessVariance("Smoothness Variance", Range( 0 , 1)) = 0.2
		[Header(GRUNGE HORIZONTAL )][Enum(Off,0,Active,1,Active Inverted,2)]_Horizontalwear_Mode("Mode", Int) = 0
		_Horizontalwear_Tint("Tint", Color) = (1,1,1,0)
		[SingleLineTexture]_Horizontalwear_GrungeMap("Grunge Map", 2D) = "white" {}
		[Normal][SingleLineTexture]_Horizontalwear_GrungeNormal("Grunge Normal", 2D) = "bump" {}
		_Horizontalwear_TilingX("Tiling X", Float) = 1
		_Horizontalwear_TilingY("Tiling Y", Float) = 1
		_Horizontalwear_OffsetX("Offset X", Float) = 0
		_Horizontalwear_OffsetY("Offset Y", Float) = 0
		_Horizontalwear_Metallic("Metallic", Range( 0 , 1)) = 0
		_Horizontalwear_Smoothness("Smoothness", Range( 0 , 1)) = 0
		_Horizontalwear_Saturation("Saturation", Range( -1 , 5)) = 1
		_Horizontalwear_NormalMultiplier("Normal Multiplier", Range( 0 , 10)) = 1
		[SingleLineTexture]_Horizontalwear_GrungeMask("Grunge Mask", 2D) = "white" {}
		_Horizontalwear_TilingXMask("Tiling X", Float) = 1
		_Horizontalwear_TilingYMask("Tiling Y", Float) = 1
		_Horizontalwear_OffsetXMask("Offset X", Float) = 0
		_Horizontalwear_OffsetYMask("Offset Y", Float) = 0
		_Horizontalwear_Rotation("Rotation", Float) = 0
		_Horizontalwear_BlendStrength("Blend Strength", Range( 0 , 0.99)) = 0.5
		_Horizontalwear_BlendMix("Blend Mix", Range( 0 , 1.5)) = 1
		[Header(GRUNGE VERTICAL)][Enum(Off,0,Active,1,Active Inverted,2)]_Verticalwear_Mode("Mode", Int) = 0
		_Verticalwear_Tint("Tint", Color) = (1,1,1,1)
		[SingleLineTexture]_Verticalwear_GrungeMap("Grunge Map", 2D) = "white" {}
		[Normal][SingleLineTexture]_Verticalwear_GrungeNormal("Grunge Normal", 2D) = "bump" {}
		_Verticalwear_TilingX("Tiling X", Float) = 1
		_Verticalwear_TilingY("Tiling Y", Float) = 1
		_Verticalwear_OffsetX("Offset X", Float) = 0
		_Verticalwear_OffsetY("Offset Y", Float) = 0
		_Verticalwear_Metallic("Metallic", Range( 0 , 1)) = 0
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		_Verticalwear_Smoothness("Smoothness", Range( 0 , 1)) = 0
		_Verticalwear_Saturation("Saturation", Range( -1 , 5)) = 1
		_Verticalwear_NormalMultiplier("Normal Strength", Range( 0 , 10)) = 1
		[SingleLineTexture]_Verticalwear_GrungeMask("Grunge Mask", 2D) = "white" {}
		_Verticalwear_TilingXMask("Tiling X", Float) = 1
		_Verticalwear_TilingYMask("Tiling Y", Float) = 1
		_Verticalwear_OffsetXMask("Offset X", Float) = 0
		_Verticalwear_OffsetYMask("Offset Y", Float) = 0
		_Verticalwear_Rotation("Rotation", Float) = 395.55
		_Verticalwear_BlendMix("Blend Mix", Range( 0 , 1.5)) = 1
		_Verticalwear_BlendStrength("Blend Strength", Range( 0 , 0.99)) = 0.5
		[Header(GRUNGE CURVATURE WEAR)][Enum(Off,0,Active,1,Active Inverted,2)]_Curvaturewear_Mode("Mode", Int) = 0
		_Curvaturewear_Tint("Tint", Color) = (1,1,1,1)
		[SingleLineTexture]_Curvaturewear_GrungeMap("Grunge Map", 2D) = "white" {}
		[Normal][SingleLineTexture]_Curvaturewear_GrungeNormal("Grunge Normal", 2D) = "bump" {}
		_Curvaturewear_TilingX("Tiling X", Float) = 1
		_Curvaturewear_TilingY("Tiling Y", Float) = 1
		_Curvaturewear_OffsetX("Offset X", Float) = 0
		_Curvaturewear_OffsetY("Offset Y", Float) = 0
		_Curvaturewear_Metallic("Metallic", Range( 0 , 1)) = 0
		_Curvaturewear_Smoothness("Smoothness", Range( 0 , 1)) = 0
		_Curvaturewear_Saturation("Saturation", Range( -1 , 5)) = 1
		_Curvaturewear_NormalMultiplier("Normal Multiplier", Range( 0 , 10)) = 1
		[SingleLineTexture]_Curvaturewear_GrungeMask("Grunge Mask", 2D) = "white" {}
		_Curvaturewear_TilingXMask("Tiling X", Float) = 1
		_Curvaturewear_TilingYMask("Tiling Y", Float) = 1
		_Curvaturewear_OffsetXMask("Offset X", Float) = 0
		_Curvaturewear_OffsetYMask("Offset Y", Float) = 0
		_Curvaturewear_Rotation("Rotation", Float) = 0
		_Curvaturewear_BlendMix("Blend Mix", Range( 0 , 1)) = 0
		_Curvaturewear_BlendStrength("Blend Strength", Range( 0 , 0.99)) = 0.5
		_Curvaturewear_BlendHardness("Blend Hardness", Range( 0.75 , 2)) = 2
		[HideInInspector] __dirty( "", Int ) = 1
		[Header(Forward Rendering Options)]
		[ToggleOff] _SpecularHighlights("Specular Highlights", Float) = 1.0
		[ToggleOff] _GlossyReflections("Reflections", Float) = 1.0
	}

	SubShader
	{
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry-10" "IgnoreProjector" = "True" "NatureRendererInstancing"="True" }
		LOD 200
		Cull [_CullMode]
		ZWrite [_ZWriteMode]
		ZTest LEqual
		ColorMask [_ColorMask]
		CGPROGRAM
		#include "UnityStandardUtils.cginc"
		#include "UnityShaderVariables.cginc"
		#pragma target 4.6
		#pragma shader_feature _SPECULARHIGHLIGHTS_OFF
		#pragma shader_feature _GLOSSYREFLECTIONS_OFF
		#pragma multi_compile_instancing
		#pragma instancing_options procedural:SetupNatureRenderer forwardadd
		#pragma multi_compile GPU_FRUSTUM_ON __
		#include "Nature Renderer.cginc"
		#pragma multi_compile_local _ NATURE_RENDERER
		#define ASE_USING_SAMPLING_MACROS 1
		#if defined(SHADER_API_D3D11) || defined(SHADER_API_XBOXONE) || defined(UNITY_COMPILER_HLSLCC) || defined(SHADER_API_PSSL) || (defined(SHADER_TARGET_SURFACE_ANALYSIS) && !defined(SHADER_TARGET_SURFACE_ANALYSIS_MOJOSHADER))//ASE Sampler Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex.Sample(samplerTex,coord)
		#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex.SampleLevel(samplerTex,coord, lod)
		#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex.SampleBias(samplerTex,coord,bias)
		#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex.SampleGrad(samplerTex,coord,ddx,ddy)
		#else//ASE Sampling Macros
		#define SAMPLE_TEXTURE2D(tex,samplerTex,coord) tex2D(tex,coord)
		#define SAMPLE_TEXTURE2D_LOD(tex,samplerTex,coord,lod) tex2Dlod(tex,float4(coord,0,lod))
		#define SAMPLE_TEXTURE2D_BIAS(tex,samplerTex,coord,bias) tex2Dbias(tex,float4(coord,0,bias))
		#define SAMPLE_TEXTURE2D_GRAD(tex,samplerTex,coord,ddx,ddy) tex2Dgrad(tex,coord,ddx,ddy)
		#endif//ASE Sampling Macros

		#pragma surface surf Standard keepalpha addshadow fullforwardshadows dithercrossfade 
		struct Input
		{
			float2 uv_texcoord;
			float3 worldNormal;
			INTERNAL_DATA
			float3 worldPos;
			float4 vertexColor : COLOR;
		};

		uniform int _ColorMask;
		uniform int _CullMode;
		uniform int _ZWriteMode;
		uniform int _Curvaturewear_Mode;
		uniform int _Verticalwear_Mode;
		uniform int _Horizontalwear_Mode;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_BumpMap);
		uniform float _TilingX;
		uniform float _TilingY;
		uniform float _OffsetX;
		uniform float _OffsetY;
		SamplerState sampler_trilinear_repeat;
		uniform half _NormalStrength;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Horizontalwear_GrungeNormal);
		uniform float _Horizontalwear_TilingX;
		uniform float _Horizontalwear_TilingY;
		uniform float _Horizontalwear_OffsetX;
		uniform float _Horizontalwear_OffsetY;
		uniform float _Horizontalwear_NormalMultiplier;
		uniform float _Horizontalwear_BlendStrength;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Horizontalwear_GrungeMask);
		uniform float _Horizontalwear_Rotation;
		uniform float _Horizontalwear_TilingXMask;
		uniform float _Horizontalwear_TilingYMask;
		uniform float _Horizontalwear_OffsetXMask;
		uniform float _Horizontalwear_OffsetYMask;
		uniform float _Horizontalwear_BlendMix;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Verticalwear_GrungeNormal);
		uniform float _Verticalwear_TilingX;
		uniform float _Verticalwear_TilingY;
		uniform float _Verticalwear_OffsetX;
		uniform float _Verticalwear_OffsetY;
		uniform float _Verticalwear_NormalMultiplier;
		uniform float _Verticalwear_BlendStrength;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Verticalwear_GrungeMask);
		uniform float _Verticalwear_Rotation;
		uniform float _Verticalwear_TilingXMask;
		uniform float _Verticalwear_TilingYMask;
		uniform float _Verticalwear_OffsetXMask;
		uniform float _Verticalwear_OffsetYMask;
		uniform float _Verticalwear_BlendMix;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Curvaturewear_GrungeNormal);
		uniform float _Curvaturewear_TilingX;
		uniform float _Curvaturewear_TilingY;
		uniform float _Curvaturewear_OffsetX;
		uniform float _Curvaturewear_OffsetY;
		uniform float _Curvaturewear_NormalMultiplier;
		uniform float _Curvaturewear_BlendStrength;
		uniform float _Curvaturewear_BlendMix;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Curvaturewear_GrungeMask);
		uniform float _Curvaturewear_Rotation;
		uniform float _Curvaturewear_TilingXMask;
		uniform float _Curvaturewear_TilingYMask;
		uniform float _Curvaturewear_OffsetXMask;
		uniform float _Curvaturewear_OffsetYMask;
		uniform float _Curvaturewear_BlendHardness;
		uniform int _Gradient_Mode;
		uniform float4 _Color;
		uniform float4 _Gradient_TintCurvature;
		uniform float4 _Gradient_BottomSide;
		uniform float4 _Gradient_Bottom;
		uniform float4 _Gradient_TopSide;
		uniform float4 _Gradient_Top;
		uniform float _Gradient_Height;
		uniform float _Gradient_Ramp;
		uniform float _Gradient_Contrast;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainTex);
		uniform half _Brightness;
		uniform float4 _Horizontalwear_Tint;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Horizontalwear_GrungeMap);
		uniform half _Horizontalwear_Saturation;
		uniform float4 _Verticalwear_Tint;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Verticalwear_GrungeMap);
		uniform half _Verticalwear_Saturation;
		uniform float4 _Curvaturewear_Tint;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Curvaturewear_GrungeMap);
		uniform half _Curvaturewear_Saturation;
		uniform float _MetallicStrength;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MetallicGlossMap);
		uniform float _Horizontalwear_Metallic;
		uniform float _Verticalwear_Metallic;
		uniform float _Curvaturewear_Metallic;
		uniform int _SmoothnessModeSurface;
		uniform int _SmoothnessType;
		uniform float _SmoothnessStrength;
		uniform float _SmoothnessVariance;
		uniform float _SmoothnessThreshold;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_SmoothnessMap);
		UNITY_DECLARE_TEX2D_NOSAMPLER(_OcclusionMap);
		uniform int _OcclusionSourceMode;
		uniform float _OcclusionStrengthAO;
		uniform float _Horizontalwear_Smoothness;
		uniform float _Verticalwear_Smoothness;
		uniform float _Curvaturewear_Smoothness;


		float4 float4switch1476_g39592( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else if(m_switch ==2)
				return m_ActiveInverted;
			else
			return float4(0,0,0,0);
		}


		float3 float3switch1329_g39592( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveInverted )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else if(m_switch ==2)
				return m_ActiveInverted;
			else
			return float3(0,0,0);
		}


		float4 float4switch1400_g39592( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else if(m_switch ==2)
				return m_ActiveInverted;
			else
			return float4(0,0,0,0);
		}


		float3 float3switch1413_g39592( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveInverted )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else if(m_switch ==2)
				return m_ActiveInverted;
			else
			return float3(0,0,0);
		}


		float4 float4switch1491_g39592( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else if(m_switch ==2)
				return m_ActiveInverted;
			else
			return float4(0,0,0,0);
		}


		float3 float3switch1416_g39592( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveInverted )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else if(m_switch ==2)
				return m_ActiveInverted;
			else
			return float3(0,0,0);
		}


		float4 float4switch143_g39556( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else if(m_switch ==2)
				return m_ActiveInverted;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch1269_g39592( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else if(m_switch ==2)
				return m_ActiveInverted;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch1377_g39592( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else if(m_switch ==2)
				return m_ActiveInverted;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch1380_g39592( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else if(m_switch ==2)
				return m_ActiveInverted;
			else
			return float4(0,0,0,0);
		}


		float floatswitch1434_g39592( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else if(m_switch ==2)
				return m_ActiveInverted;
			else
			return float(0);
		}


		float floatswitch1435_g39592( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else if(m_switch ==2)
				return m_ActiveInverted;
			else
			return float(0);
		}


		float floatswitch1436_g39592( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else if(m_switch ==2)
				return m_ActiveInverted;
			else
			return float(0);
		}


		float4 float4switch170_g39551( int m_switch, float4 m_Smoothness, float4 m_Roughness )
		{
			if(m_switch ==0)
				return m_Smoothness;
			else if(m_switch ==1)
				return m_Roughness;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch167_g39551( int m_switch, float4 m_Smoothness, float4 m_Roughness )
		{
			if(m_switch ==0)
				return m_Smoothness;
			else if(m_switch ==1)
				return m_Roughness;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch99_g39551( int m_switch, float4 m_Standard, float4 m_Geometric, float4 m_Texture )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Geometric;
			else if(m_switch ==2)
				return m_Texture;
			else
			return float4(0,0,0,0);
		}


		float floatswitch1075_g39592( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else if(m_switch ==2)
				return m_ActiveInverted;
			else
			return float(0);
		}


		float floatswitch1432_g39592( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else if(m_switch ==2)
				return m_ActiveInverted;
			else
			return float(0);
		}


		float floatswitch1433_g39592( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else if(m_switch ==2)
				return m_ActiveInverted;
			else
			return float(0);
		}


		void surf( Input i , inout SurfaceOutputStandard o )
		{
			int m_switch1416_g39592 = _Curvaturewear_Mode;
			int m_switch1413_g39592 = _Verticalwear_Mode;
			int m_switch1329_g39592 = _Horizontalwear_Mode;
			float2 appendResult150_g38027 = (float2(_TilingX , _TilingY));
			float2 appendResult151_g38027 = (float2(_OffsetX , _OffsetY));
			float2 uv_TexCoord2_g39586 = i.uv_texcoord * appendResult150_g38027 + appendResult151_g38027;
			float2 appendResult6_g39586 = (float2(uv_TexCoord2_g39586.x , uv_TexCoord2_g39586.y));
			float2 OUT_UV431_g38027 = appendResult6_g39586;
			float2 UV40_g39580 = OUT_UV431_g38027;
			float4 OUT_NORMAL1178_g38027 = SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, UV40_g39580 );
			float4 temp_output_1_0_g39549 = OUT_NORMAL1178_g38027;
			float temp_output_8_0_g39549 = _NormalStrength;
			float3 temp_output_1478_59_g38027 = UnpackScaleNormal( temp_output_1_0_g39549, temp_output_8_0_g39549 );
			float3 temp_output_8_0_g39592 = temp_output_1478_59_g38027;
			float3 m_Off1329_g39592 = temp_output_8_0_g39592;
			float2 appendResult1344_g39592 = (float2(_Horizontalwear_TilingX , _Horizontalwear_TilingY));
			float2 appendResult1343_g39592 = (float2(_Horizontalwear_OffsetX , _Horizontalwear_OffsetY));
			float2 uv_TexCoord1342_g39592 = i.uv_texcoord * appendResult1344_g39592 + appendResult1343_g39592;
			float4 temp_output_1_0_g39605 = SAMPLE_TEXTURE2D( _Horizontalwear_GrungeNormal, sampler_trilinear_repeat, uv_TexCoord1342_g39592 );
			float temp_output_8_0_g39605 = ( _Horizontalwear_NormalMultiplier * _Horizontalwear_BlendStrength );
			float3 FINAL_MASKNORMAL_HORIZONTAL803_g39592 = UnpackScaleNormal( temp_output_1_0_g39605, temp_output_8_0_g39605 );
			float4 temp_cast_2 = (0.5).xxxx;
			float4 temp_cast_3 = (0.75).xxxx;
			int _Horizontalwear_Mode1003_g39592 = _Horizontalwear_Mode;
			int m_switch1476_g39592 = _Horizontalwear_Mode1003_g39592;
			float cos1_g39615 = cos( radians( _Horizontalwear_Rotation ) );
			float sin1_g39615 = sin( radians( _Horizontalwear_Rotation ) );
			float2 rotator1_g39615 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos1_g39615 , -sin1_g39615 , sin1_g39615 , cos1_g39615 )) + float2( 0.5,0.5 );
			float2 appendResult811_g39592 = (float2(_Horizontalwear_TilingXMask , _Horizontalwear_TilingYMask));
			float2 appendResult1164_g39592 = (float2(_Horizontalwear_OffsetXMask , _Horizontalwear_OffsetYMask));
			float4 m_Off1476_g39592 = SAMPLE_TEXTURE2D( _Horizontalwear_GrungeMask, sampler_trilinear_repeat, (rotator1_g39615*appendResult811_g39592 + appendResult1164_g39592) );
			float4 m_Active1476_g39592 = SAMPLE_TEXTURE2D( _Horizontalwear_GrungeMask, sampler_trilinear_repeat, (rotator1_g39615*appendResult811_g39592 + appendResult1164_g39592) );
			float4 m_ActiveInverted1476_g39592 = saturate( ( 1.0 - SAMPLE_TEXTURE2D( _Horizontalwear_GrungeMask, sampler_trilinear_repeat, (rotator1_g39615*appendResult811_g39592 + appendResult1164_g39592) ) ) );
			float4 localfloat4switch1476_g39592 = float4switch1476_g39592( m_switch1476_g39592 , m_Off1476_g39592 , m_Active1476_g39592 , m_ActiveInverted1476_g39592 );
			float4 temp_output_44_0_g39622 = localfloat4switch1476_g39592;
			float4 VECTOR_IN212_g39622 = temp_output_44_0_g39622;
			float4 _Vec = float4(0.001,0.001,0.001,0.001);
			float4 Vect_0019_g39622 = _Vec;
			float2 _SmoothHorizontal = float2(0,0.5);
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 temp_output_40_0_g39622 = abs( ase_worldNormal );
			float WN_HORIZONTAL141_g39622 = ( ( temp_output_40_0_g39622 * temp_output_40_0_g39622 ).y + 0.07 );
			float smoothstepResult205_g39622 = smoothstep( _SmoothHorizontal.x , _SmoothHorizontal.y , ( ( 1.0 - WN_HORIZONTAL141_g39622 ) + -0.1 ));
			float4 lerpResult200_g39622 = lerp( VECTOR_IN212_g39622 , Vect_0019_g39622 , smoothstepResult205_g39622);
			float4 MASK_HORIZONTAL204_g39622 = lerpResult200_g39622;
			float4 temp_cast_7 = (_Horizontalwear_BlendStrength).xxxx;
			float4 temp_cast_8 = (-1.0).xxxx;
			float4 smoothstepResult75_g39622 = smoothstep( temp_cast_2 , temp_cast_3 , (float4( 0,0,0,0 ) + (( 1.0 - MASK_HORIZONTAL204_g39622 ) - temp_cast_7) * (temp_cast_8 - float4( 0,0,0,0 )) / (float4( 1,1,1,1 ) - temp_cast_7)));
			float4 _MinOldVect4 = float4(0,0,0,0);
			float MASK_HORIZONTAL808_g39592 = ( (( ( smoothstepResult75_g39622 - _MinOldVect4 ) / ( float4(1,1,1,1) - _MinOldVect4 ) )).x * _Horizontalwear_BlendMix );
			float3 lerpResult1335_g39592 = lerp( temp_output_8_0_g39592 , FINAL_MASKNORMAL_HORIZONTAL803_g39592 , MASK_HORIZONTAL808_g39592);
			float3 m_Active1329_g39592 = lerpResult1335_g39592;
			float3 m_ActiveInverted1329_g39592 = lerpResult1335_g39592;
			float3 localfloat3switch1329_g39592 = float3switch1329_g39592( m_switch1329_g39592 , m_Off1329_g39592 , m_Active1329_g39592 , m_ActiveInverted1329_g39592 );
			float3 m_Off1413_g39592 = localfloat3switch1329_g39592;
			float2 appendResult1384_g39592 = (float2(_Verticalwear_TilingX , _Verticalwear_TilingY));
			float2 appendResult1386_g39592 = (float2(_Verticalwear_OffsetX , _Verticalwear_OffsetY));
			float2 uv_TexCoord1388_g39592 = i.uv_texcoord * appendResult1384_g39592 + appendResult1386_g39592;
			float4 temp_output_1_0_g39603 = SAMPLE_TEXTURE2D( _Verticalwear_GrungeNormal, sampler_trilinear_repeat, uv_TexCoord1388_g39592 );
			float temp_output_8_0_g39603 = ( _Verticalwear_NormalMultiplier * _Verticalwear_BlendStrength );
			float3 FINAL_MASKNORMAL_VERTICAL630_g39592 = UnpackScaleNormal( temp_output_1_0_g39603, temp_output_8_0_g39603 );
			float4 temp_cast_10 = (0.5).xxxx;
			float4 temp_cast_11 = (0.75).xxxx;
			int _Verticalwear_Mode1004_g39592 = _Verticalwear_Mode;
			int m_switch1400_g39592 = _Verticalwear_Mode1004_g39592;
			float cos1_g39609 = cos( radians( _Verticalwear_Rotation ) );
			float sin1_g39609 = sin( radians( _Verticalwear_Rotation ) );
			float2 rotator1_g39609 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos1_g39609 , -sin1_g39609 , sin1_g39609 , cos1_g39609 )) + float2( 0.5,0.5 );
			float2 appendResult41_g39592 = (float2(_Verticalwear_TilingXMask , _Verticalwear_TilingYMask));
			float2 appendResult1165_g39592 = (float2(_Verticalwear_OffsetXMask , _Verticalwear_OffsetYMask));
			float4 m_Off1400_g39592 = SAMPLE_TEXTURE2D( _Verticalwear_GrungeMask, sampler_trilinear_repeat, (rotator1_g39609*appendResult41_g39592 + appendResult1165_g39592) );
			float4 m_Active1400_g39592 = SAMPLE_TEXTURE2D( _Verticalwear_GrungeMask, sampler_trilinear_repeat, (rotator1_g39609*appendResult41_g39592 + appendResult1165_g39592) );
			float4 m_ActiveInverted1400_g39592 = saturate( ( 1.0 - SAMPLE_TEXTURE2D( _Verticalwear_GrungeMask, sampler_trilinear_repeat, (rotator1_g39609*appendResult41_g39592 + appendResult1165_g39592) ) ) );
			float4 localfloat4switch1400_g39592 = float4switch1400_g39592( m_switch1400_g39592 , m_Off1400_g39592 , m_Active1400_g39592 , m_ActiveInverted1400_g39592 );
			float4 temp_output_44_0_g39593 = localfloat4switch1400_g39592;
			float3 temp_output_40_0_g39593 = abs( ase_worldNormal );
			float WN_HORIZONTAL141_g39593 = ( ( temp_output_40_0_g39593 * temp_output_40_0_g39593 ).y + 0.07 );
			float4 lerpResult2_g39593 = lerp( temp_output_44_0_g39593 , _Vec , WN_HORIZONTAL141_g39593);
			float4 VECTOR_IN_MASKED112_g39593 = lerpResult2_g39593;
			float4 Vect_0019_g39593 = _Vec;
			float3 break349_g39593 = ase_worldNormal;
			float WN_NY173_g39593 = break349_g39593.y;
			float WN_NZ184_g39593 = break349_g39593.z;
			float WN_NX186_g39593 = break349_g39593.x;
			float temp_output_175_0_g39593 = ( -WN_NY173_g39593 + WN_NZ184_g39593 + -WN_NX186_g39593 );
			float4 lerpResult133_g39593 = lerp( VECTOR_IN_MASKED112_g39593 , Vect_0019_g39593 , ( temp_output_175_0_g39593 + -temp_output_175_0_g39593 + 0.07 ));
			float4 MASK_SIDE163_g39593 = lerpResult133_g39593;
			float4 temp_cast_15 = (_Verticalwear_BlendStrength).xxxx;
			float4 temp_cast_16 = (-2.0).xxxx;
			float4 smoothstepResult75_g39593 = smoothstep( temp_cast_10 , temp_cast_11 , (float4( 0,0,0,0 ) + (( 1.0 - MASK_SIDE163_g39593 ) - temp_cast_15) * (temp_cast_16 - float4( 0,0,0,0 )) / (float4( 1,1,1,1 ) - temp_cast_15)));
			float MASK_VERTICAL602_g39592 = ( (( ( smoothstepResult75_g39593 - _MinOldVect4 ) / ( float4(1,1,1,1) - _MinOldVect4 ) )).x * _Verticalwear_BlendMix );
			float3 lerpResult1414_g39592 = lerp( localfloat3switch1329_g39592 , FINAL_MASKNORMAL_VERTICAL630_g39592 , MASK_VERTICAL602_g39592);
			float3 m_Active1413_g39592 = lerpResult1414_g39592;
			float3 m_ActiveInverted1413_g39592 = lerpResult1414_g39592;
			float3 localfloat3switch1413_g39592 = float3switch1413_g39592( m_switch1413_g39592 , m_Off1413_g39592 , m_Active1413_g39592 , m_ActiveInverted1413_g39592 );
			float3 m_Off1416_g39592 = localfloat3switch1413_g39592;
			float3 NORMAL_IN1546_g39592 = temp_output_8_0_g39592;
			float2 appendResult1393_g39592 = (float2(_Curvaturewear_TilingX , _Curvaturewear_TilingY));
			float2 appendResult1390_g39592 = (float2(_Curvaturewear_OffsetX , _Curvaturewear_OffsetY));
			float2 uv_TexCoord1389_g39592 = i.uv_texcoord * appendResult1393_g39592 + appendResult1390_g39592;
			float4 temp_output_1_0_g39597 = SAMPLE_TEXTURE2D( _Curvaturewear_GrungeNormal, sampler_trilinear_repeat, uv_TexCoord1389_g39592 );
			float temp_output_8_0_g39597 = ( _Curvaturewear_NormalMultiplier * _Curvaturewear_BlendStrength );
			float3 lerpResult1537_g39592 = lerp( NORMAL_IN1546_g39592 , UnpackScaleNormal( temp_output_1_0_g39597, temp_output_8_0_g39597 ) , _Curvaturewear_BlendMix);
			float3 FINAL_MASKNORMAL_CURVATURE599_g39592 = lerpResult1537_g39592;
			float4 temp_cast_18 = (0.5).xxxx;
			float4 temp_cast_19 = (0.75).xxxx;
			int _Curvaturewear_Mode398_g39592 = _Curvaturewear_Mode;
			int m_switch1491_g39592 = _Curvaturewear_Mode398_g39592;
			float cos1_g39624 = cos( radians( _Curvaturewear_Rotation ) );
			float sin1_g39624 = sin( radians( _Curvaturewear_Rotation ) );
			float2 rotator1_g39624 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos1_g39624 , -sin1_g39624 , sin1_g39624 , cos1_g39624 )) + float2( 0.5,0.5 );
			float2 appendResult38_g39592 = (float2(_Curvaturewear_TilingXMask , _Curvaturewear_TilingYMask));
			float2 appendResult1168_g39592 = (float2(_Curvaturewear_OffsetXMask , _Curvaturewear_OffsetYMask));
			float4 m_Off1491_g39592 = SAMPLE_TEXTURE2D( _Curvaturewear_GrungeMask, sampler_trilinear_repeat, (rotator1_g39624*appendResult38_g39592 + appendResult1168_g39592) );
			float4 m_Active1491_g39592 = SAMPLE_TEXTURE2D( _Curvaturewear_GrungeMask, sampler_trilinear_repeat, (rotator1_g39624*appendResult38_g39592 + appendResult1168_g39592) );
			float4 m_ActiveInverted1491_g39592 = saturate( ( 1.0 - SAMPLE_TEXTURE2D( _Curvaturewear_GrungeMask, sampler_trilinear_repeat, (rotator1_g39624*appendResult38_g39592 + appendResult1168_g39592) ) ) );
			float4 localfloat4switch1491_g39592 = float4switch1491_g39592( m_switch1491_g39592 , m_Off1491_g39592 , m_Active1491_g39592 , m_ActiveInverted1491_g39592 );
			float4 temp_output_44_0_g39601 = localfloat4switch1491_g39592;
			float3 temp_output_40_0_g39601 = abs( ase_worldNormal );
			float WN_HORIZONTAL141_g39601 = ( ( temp_output_40_0_g39601 * temp_output_40_0_g39601 ).y + 0.07 );
			float4 lerpResult2_g39601 = lerp( temp_output_44_0_g39601 , _Vec , WN_HORIZONTAL141_g39601);
			float4 VECTOR_IN_MASKED112_g39601 = lerpResult2_g39601;
			float4 Vect_0019_g39601 = _Vec;
			float2 _SmoothX = float2(0,0.45);
			float3 temp_cast_23 = (0.5).xxx;
			float3 break24_g39601 = ( temp_output_40_0_g39601 - temp_cast_23 );
			float WN_X134_g39601 = break24_g39601.x;
			float smoothstepResult8_g39601 = smoothstep( _SmoothX.x , _SmoothX.y , ( WN_X134_g39601 + 1.25 ));
			float smoothstepResult22_g39601 = smoothstep( _SmoothX.x , _SmoothX.y , ( -WN_X134_g39601 + 0.02 ));
			float lerpResult11_g39601 = lerp( 0.0 , smoothstepResult8_g39601 , smoothstepResult22_g39601);
			float4 lerpResult14_g39601 = lerp( VECTOR_IN_MASKED112_g39601 , Vect_0019_g39601 , lerpResult11_g39601);
			float4 MASK_VERTICAL_X159_g39601 = lerpResult14_g39601;
			float2 _SmoothY = float2(0,0.85);
			float WN_Y135_g39601 = break24_g39601.y;
			float smoothstepResult29_g39601 = smoothstep( _SmoothY.x , _SmoothY.y , ( -WN_Y135_g39601 + 0.35 ));
			float4 lerpResult6_g39601 = lerp( VECTOR_IN_MASKED112_g39601 , Vect_0019_g39601 , smoothstepResult29_g39601);
			float4 MASK_VERTICAL_Y157_g39601 = lerpResult6_g39601;
			float2 _SmoothZ = float2(1.8,1.4);
			float WN_Z136_g39601 = break24_g39601.z;
			float smoothstepResult26_g39601 = smoothstep( _SmoothZ.x , _SmoothZ.y , ( WN_Z136_g39601 + 2.06 ));
			float lerpResult34_g39601 = lerp( smoothstepResult26_g39601 , 0.0 , ( -WN_Z136_g39601 + 2.05 ));
			float4 lerpResult5_g39601 = lerp( Vect_0019_g39601 , VECTOR_IN_MASKED112_g39601 , lerpResult34_g39601);
			float4 MASK_VERTICAL_Z155_g39601 = lerpResult5_g39601;
			float4 temp_cast_24 = (_Curvaturewear_BlendStrength).xxxx;
			float4 temp_cast_25 = (_Curvaturewear_BlendHardness).xxxx;
			float4 smoothstepResult75_g39601 = smoothstep( temp_cast_18 , temp_cast_19 , (float4( 0,0,0,0 ) + (( 1.0 - ( MASK_VERTICAL_X159_g39601 + MASK_VERTICAL_Y157_g39601 + MASK_VERTICAL_Z155_g39601 ) ) - temp_cast_24) * (temp_cast_25 - float4( 0,0,0,0 )) / (float4( 1,1,1,1 ) - temp_cast_24)));
			float MASK_CURVATURE401_g39592 = (( ( smoothstepResult75_g39601 - _MinOldVect4 ) / ( float4(1,1,1,1) - _MinOldVect4 ) )).x;
			float3 lerpResult1417_g39592 = lerp( FINAL_MASKNORMAL_CURVATURE599_g39592 , localfloat3switch1413_g39592 , MASK_CURVATURE401_g39592);
			float3 m_Active1416_g39592 = lerpResult1417_g39592;
			float3 m_ActiveInverted1416_g39592 = lerpResult1417_g39592;
			float3 localfloat3switch1416_g39592 = float3switch1416_g39592( m_switch1416_g39592 , m_Off1416_g39592 , m_Active1416_g39592 , m_ActiveInverted1416_g39592 );
			o.Normal = localfloat3switch1416_g39592;
			int m_switch1380_g39592 = _Curvaturewear_Mode;
			int m_switch1377_g39592 = _Verticalwear_Mode;
			int m_switch1269_g39592 = _Horizontalwear_Mode;
			int _Gradient_Mode161_g39556 = _Gradient_Mode;
			int m_switch143_g39556 = _Gradient_Mode161_g39556;
			float4 TINT147_g39556 = _Color;
			float4 m_Off143_g39556 = TINT147_g39556;
			float4 _Vector0 = float4(0.001,0.001,0.001,0.001);
			float3 temp_output_275_0_g39556 = abs( ase_worldNormal );
			float WN_HORIZONTAL284_g39556 = ( ( temp_output_275_0_g39556 * temp_output_275_0_g39556 ).y + 0.07 );
			float4 lerpResult341_g39556 = lerp( _Gradient_TintCurvature , _Vector0 , WN_HORIZONTAL284_g39556);
			float4 VECTOR_IN_MASKED343_g39556 = lerpResult341_g39556;
			float4 Vect_001349_g39556 = _Vector0;
			float2 _Vector3 = float2(0,0.45);
			float3 temp_cast_28 = (0.5).xxx;
			float3 break277_g39556 = ( temp_output_275_0_g39556 - temp_cast_28 );
			float WN_X280_g39556 = break277_g39556.x;
			float smoothstepResult303_g39556 = smoothstep( _Vector3.x , _Vector3.y , ( WN_X280_g39556 + 1.25 ));
			float smoothstepResult299_g39556 = smoothstep( _Vector3.x , _Vector3.y , ( -WN_X280_g39556 + 0.02 ));
			float lerpResult306_g39556 = lerp( 0.0 , smoothstepResult303_g39556 , smoothstepResult299_g39556);
			float4 lerpResult301_g39556 = lerp( VECTOR_IN_MASKED343_g39556 , Vect_001349_g39556 , lerpResult306_g39556);
			float4 MASK_VERTICAL_X307_g39556 = lerpResult301_g39556;
			float2 _Vector1 = float2(0,0.85);
			float WN_Y281_g39556 = break277_g39556.y;
			float smoothstepResult334_g39556 = smoothstep( _Vector1.x , _Vector1.y , ( -WN_Y281_g39556 + 0.35 ));
			float4 lerpResult333_g39556 = lerp( VECTOR_IN_MASKED343_g39556 , Vect_001349_g39556 , smoothstepResult334_g39556);
			float4 MASK_VERTICAL_Y320_g39556 = lerpResult333_g39556;
			float2 _HelloRicardo = float2(1.8,1.4);
			float WN_Z282_g39556 = break277_g39556.z;
			float smoothstepResult331_g39556 = smoothstep( _HelloRicardo.x , _HelloRicardo.y , ( WN_Z282_g39556 + 2.06 ));
			float lerpResult327_g39556 = lerp( smoothstepResult331_g39556 , 0.0 , ( -WN_Z282_g39556 + 2.05 ));
			float4 lerpResult314_g39556 = lerp( Vect_001349_g39556 , VECTOR_IN_MASKED343_g39556 , lerpResult327_g39556);
			float4 MASK_VERTICAL_Z315_g39556 = lerpResult314_g39556;
			float4 Curvature353_g39556 = saturate( ( MASK_VERTICAL_X307_g39556 + MASK_VERTICAL_Y320_g39556 + MASK_VERTICAL_Z315_g39556 ) );
			float4 lerpResult117_g39556 = lerp( _Gradient_BottomSide , _Gradient_Bottom , WN_HORIZONTAL284_g39556);
			float4 lerpResult111_g39556 = lerp( _Gradient_TopSide , _Gradient_Top , WN_HORIZONTAL284_g39556);
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float clampResult106_g39556 = clamp( ( ase_vertex3Pos.y / _Gradient_Height ) , 0.0 , 1.0 );
			float4 lerpResult113_g39556 = lerp( lerpResult117_g39556 , lerpResult111_g39556 , clampResult106_g39556);
			float3 temp_output_145_0_g39556 = (( Curvature353_g39556 + lerpResult113_g39556 )).xyz;
			float _Gradient_Ramp154_g39556 = _Gradient_Ramp;
			float _Gradient_Contrast157_g39556 = _Gradient_Contrast;
			float4 tex2DNode63_g39580 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g39580 );
			float4 OUT_ALBEDO_RGBA1177_g38027 = tex2DNode63_g39580;
			float4 ALBEDO151_g39556 = OUT_ALBEDO_RGBA1177_g38027;
			float smoothstepResult142_g39556 = smoothstep( ( _Gradient_Ramp154_g39556 - ( _Gradient_Ramp154_g39556 * ( 1.0 - _Gradient_Contrast157_g39556 ) ) ) , ALBEDO151_g39556.x , _Gradient_Ramp154_g39556);
			float4 lerpResult139_g39556 = lerp( TINT147_g39556 , float4( temp_output_145_0_g39556 , 0.0 ) , smoothstepResult142_g39556);
			float4 m_Active143_g39556 = lerpResult139_g39556;
			float4 lerpResult141_g39556 = lerp( float4( temp_output_145_0_g39556 , 0.0 ) , TINT147_g39556 , smoothstepResult142_g39556);
			float4 m_ActiveInverted143_g39556 = lerpResult141_g39556;
			float4 localfloat4switch143_g39556 = float4switch143_g39556( m_switch143_g39556 , m_Off143_g39556 , m_Active143_g39556 , m_ActiveInverted143_g39556 );
			float4 temp_output_7_0_g38027 = ( localfloat4switch143_g39556 * float4( (OUT_ALBEDO_RGBA1177_g38027).rgb , 0.0 ) * _Brightness );
			float4 temp_output_6_0_g39592 = ( temp_output_7_0_g38027 + float4(0,0,0,0) );
			float4 m_Off1269_g39592 = temp_output_6_0_g39592;
			float4 tex2DNode1327_g39592 = SAMPLE_TEXTURE2D( _Horizontalwear_GrungeMap, sampler_trilinear_repeat, uv_TexCoord1342_g39592 );
			float4 temp_output_12_0_g39595 = ( float4( (_Horizontalwear_Tint).rgb , 0.0 ) * tex2DNode1327_g39592 );
			float3 desaturateInitialColor10_g39595 = temp_output_12_0_g39595.xyz;
			float desaturateDot10_g39595 = dot( desaturateInitialColor10_g39595, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar10_g39595 = lerp( desaturateInitialColor10_g39595, desaturateDot10_g39595.xxx, ( 1.0 - ( _Horizontalwear_Saturation + 1.0 ) ) );
			float3 FINAL_MASK_HORIZONTAL804_g39592 = desaturateVar10_g39595;
			float4 lerpResult861_g39592 = lerp( temp_output_6_0_g39592 , float4( FINAL_MASK_HORIZONTAL804_g39592 , 0.0 ) , MASK_HORIZONTAL808_g39592);
			float4 m_Active1269_g39592 = lerpResult861_g39592;
			float4 m_ActiveInverted1269_g39592 = lerpResult861_g39592;
			float4 localfloat4switch1269_g39592 = float4switch1269_g39592( m_switch1269_g39592 , m_Off1269_g39592 , m_Active1269_g39592 , m_ActiveInverted1269_g39592 );
			float4 m_Off1377_g39592 = localfloat4switch1269_g39592;
			float4 tex2DNode1397_g39592 = SAMPLE_TEXTURE2D( _Verticalwear_GrungeMap, sampler_trilinear_repeat, uv_TexCoord1388_g39592 );
			float4 temp_output_12_0_g39607 = ( float4( (_Verticalwear_Tint).rgb , 0.0 ) * tex2DNode1397_g39592 );
			float3 desaturateInitialColor10_g39607 = temp_output_12_0_g39607.xyz;
			float desaturateDot10_g39607 = dot( desaturateInitialColor10_g39607, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar10_g39607 = lerp( desaturateInitialColor10_g39607, desaturateDot10_g39607.xxx, ( 1.0 - ( _Verticalwear_Saturation + 1.0 ) ) );
			float3 FINAL_MASK_VERTICAL394_g39592 = desaturateVar10_g39607;
			float4 lerpResult1227_g39592 = lerp( localfloat4switch1269_g39592 , float4( FINAL_MASK_VERTICAL394_g39592 , 0.0 ) , MASK_VERTICAL602_g39592);
			float4 m_Active1377_g39592 = lerpResult1227_g39592;
			float4 m_ActiveInverted1377_g39592 = lerpResult1227_g39592;
			float4 localfloat4switch1377_g39592 = float4switch1377_g39592( m_switch1377_g39592 , m_Off1377_g39592 , m_Active1377_g39592 , m_ActiveInverted1377_g39592 );
			float4 m_Off1380_g39592 = localfloat4switch1377_g39592;
			float4 ALBEDO_IN1447_g39592 = temp_output_6_0_g39592;
			float4 tex2DNode1396_g39592 = SAMPLE_TEXTURE2D( _Curvaturewear_GrungeMap, sampler_trilinear_repeat, uv_TexCoord1389_g39592 );
			float4 temp_output_12_0_g39599 = ( float4( (_Curvaturewear_Tint).rgb , 0.0 ) * tex2DNode1396_g39592 );
			float3 desaturateInitialColor10_g39599 = temp_output_12_0_g39599.xyz;
			float desaturateDot10_g39599 = dot( desaturateInitialColor10_g39599, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar10_g39599 = lerp( desaturateInitialColor10_g39599, desaturateDot10_g39599.xxx, ( 1.0 - ( _Curvaturewear_Saturation + 1.0 ) ) );
			float4 lerpResult1544_g39592 = lerp( ALBEDO_IN1447_g39592 , float4( desaturateVar10_g39599 , 0.0 ) , _Curvaturewear_BlendMix);
			float4 FINAL_MASK_CURVATURE586_g39592 = lerpResult1544_g39592;
			float4 lerpResult860_g39592 = lerp( FINAL_MASK_CURVATURE586_g39592 , localfloat4switch1377_g39592 , MASK_CURVATURE401_g39592);
			float4 m_Active1380_g39592 = lerpResult860_g39592;
			float4 m_ActiveInverted1380_g39592 = lerpResult860_g39592;
			float4 localfloat4switch1380_g39592 = float4switch1380_g39592( m_switch1380_g39592 , m_Off1380_g39592 , m_Active1380_g39592 , m_ActiveInverted1380_g39592 );
			o.Albedo = localfloat4switch1380_g39592.xyz;
			int m_switch1436_g39592 = _Curvaturewear_Mode;
			int m_switch1435_g39592 = _Verticalwear_Mode;
			int m_switch1434_g39592 = _Horizontalwear_Mode;
			float4 _MASK_B1440_g38027 = SAMPLE_TEXTURE2D( _MetallicGlossMap, sampler_trilinear_repeat, UV40_g39580 );
			float4 temp_output_977_0_g39592 = ( _MetallicStrength * _MASK_B1440_g38027 );
			float m_Off1434_g39592 = temp_output_977_0_g39592.x;
			float FINAL_MASKMETALLIC_HORIZONTAL1026_g39592 = _Horizontalwear_Metallic;
			float4 temp_cast_52 = (FINAL_MASKMETALLIC_HORIZONTAL1026_g39592).xxxx;
			float4 lerpResult1439_g39592 = lerp( temp_output_977_0_g39592 , temp_cast_52 , MASK_HORIZONTAL808_g39592);
			float m_Active1434_g39592 = lerpResult1439_g39592.x;
			float m_ActiveInverted1434_g39592 = lerpResult1439_g39592.x;
			float localfloatswitch1434_g39592 = floatswitch1434_g39592( m_switch1434_g39592 , m_Off1434_g39592 , m_Active1434_g39592 , m_ActiveInverted1434_g39592 );
			float m_Off1435_g39592 = localfloatswitch1434_g39592;
			float FINAL_MASKMETALLIC_VERTICAL1024_g39592 = _Verticalwear_Metallic;
			float lerpResult1438_g39592 = lerp( localfloatswitch1434_g39592 , FINAL_MASKMETALLIC_VERTICAL1024_g39592 , MASK_VERTICAL602_g39592);
			float m_Active1435_g39592 = lerpResult1438_g39592;
			float m_ActiveInverted1435_g39592 = lerpResult1438_g39592;
			float localfloatswitch1435_g39592 = floatswitch1435_g39592( m_switch1435_g39592 , m_Off1435_g39592 , m_Active1435_g39592 , m_ActiveInverted1435_g39592 );
			float m_Off1436_g39592 = localfloatswitch1435_g39592;
			float4 METALLIC_IN1555_g39592 = temp_output_977_0_g39592;
			float4 temp_cast_55 = (_Curvaturewear_Metallic).xxxx;
			float4 lerpResult1553_g39592 = lerp( METALLIC_IN1555_g39592 , temp_cast_55 , _Curvaturewear_BlendMix);
			float4 FINAL_MASKMETALLIC_CURVATURE1022_g39592 = lerpResult1553_g39592;
			float4 temp_cast_56 = (localfloatswitch1435_g39592).xxxx;
			float4 lerpResult1437_g39592 = lerp( FINAL_MASKMETALLIC_CURVATURE1022_g39592 , temp_cast_56 , MASK_CURVATURE401_g39592);
			float m_Active1436_g39592 = lerpResult1437_g39592.x;
			float m_ActiveInverted1436_g39592 = lerpResult1437_g39592.x;
			float localfloatswitch1436_g39592 = floatswitch1436_g39592( m_switch1436_g39592 , m_Off1436_g39592 , m_Active1436_g39592 , m_ActiveInverted1436_g39592 );
			o.Metallic = localfloatswitch1436_g39592;
			int m_switch1433_g39592 = _Curvaturewear_Mode;
			int m_switch1432_g39592 = _Verticalwear_Mode;
			int m_switch1075_g39592 = _Horizontalwear_Mode;
			int m_switch99_g39551 = _SmoothnessModeSurface;
			int m_switch170_g39551 = _SmoothnessType;
			float4 temp_cast_59 = (_SmoothnessStrength).xxxx;
			float4 m_Smoothness170_g39551 = temp_cast_59;
			float4 temp_cast_60 = (( 1.0 - _SmoothnessStrength )).xxxx;
			float4 m_Roughness170_g39551 = temp_cast_60;
			float4 localfloat4switch170_g39551 = float4switch170_g39551( m_switch170_g39551 , m_Smoothness170_g39551 , m_Roughness170_g39551 );
			float4 FINAL_STANDARD111_g39551 = localfloat4switch170_g39551;
			float4 m_Standard99_g39551 = FINAL_STANDARD111_g39551;
			float3 NORMAL_WORLD_OUT164_g38027 = temp_output_1478_59_g38027;
			float3 temp_output_4_0_g39551 = NORMAL_WORLD_OUT164_g38027;
			float3 temp_output_23_0_g39551 = ddx( temp_output_4_0_g39551 );
			float dotResult25_g39551 = dot( temp_output_23_0_g39551 , temp_output_23_0_g39551 );
			float3 temp_output_7_0_g39551 = ddy( temp_output_4_0_g39551 );
			float dotResult27_g39551 = dot( temp_output_7_0_g39551 , temp_output_7_0_g39551 );
			float temp_output_28_0_g39551 = sqrt( saturate( ( ( _SmoothnessStrength * _SmoothnessStrength ) + min( ( ( _SmoothnessVariance * ( dotResult25_g39551 + dotResult27_g39551 ) ) * 2.0 ) , ( _SmoothnessThreshold * _SmoothnessThreshold ) ) ) ) );
			float4 break377_g38027 = OUT_ALBEDO_RGBA1177_g38027;
			float ALBEDO_R169_g38027 = break377_g38027.r;
			float4 temp_cast_61 = (ALBEDO_R169_g38027).xxxx;
			float4 FINAL_GEOMETRIC114_g39551 = ( temp_output_28_0_g39551 * ( 1.0 - temp_cast_61 ) );
			float4 m_Geometric99_g39551 = FINAL_GEOMETRIC114_g39551;
			int SMOOTHNESS_TYPE173_g39551 = _SmoothnessType;
			int m_switch167_g39551 = SMOOTHNESS_TYPE173_g39551;
			float4 _MASK_G1438_g38027 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, UV40_g39580 );
			float4 temp_output_83_0_g39551 = _MASK_G1438_g38027;
			float4 m_Smoothness167_g39551 = temp_output_83_0_g39551;
			float4 m_Roughness167_g39551 = ( 1.0 - temp_output_83_0_g39551 );
			float4 localfloat4switch167_g39551 = float4switch167_g39551( m_switch167_g39551 , m_Smoothness167_g39551 , m_Roughness167_g39551 );
			float4 FINAL_SMOOTHNESS_TEXTURE117_g39551 = ( temp_output_28_0_g39551 * localfloat4switch167_g39551 );
			float4 m_Texture99_g39551 = FINAL_SMOOTHNESS_TEXTURE117_g39551;
			float4 localfloat4switch99_g39551 = float4switch99_g39551( m_switch99_g39551 , m_Standard99_g39551 , m_Geometric99_g39551 , m_Texture99_g39551 );
			float4 temp_output_1267_33_g38027 = localfloat4switch99_g39551;
			float4 color301_g38027 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float4 _MASK_R1439_g38027 = SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, UV40_g39580 );
			float4 temp_cast_63 = (i.vertexColor.a).xxxx;
			float4 lerpResult11_g38027 = lerp( _MASK_R1439_g38027 , temp_cast_63 , (float)_OcclusionSourceMode);
			float4 lerpResult14_g38027 = lerp( color301_g38027 , lerpResult11_g38027 , _OcclusionStrengthAO);
			float4 temp_output_989_0_g39592 = ( temp_output_1267_33_g38027 * lerpResult14_g38027 );
			float m_Off1075_g39592 = temp_output_989_0_g39592.x;
			float FINAL_MASKSMOOTHNESS_HORIZONTAL1025_g39592 = _Horizontalwear_Smoothness;
			float4 temp_cast_67 = (FINAL_MASKSMOOTHNESS_HORIZONTAL1025_g39592).xxxx;
			float4 lerpResult1030_g39592 = lerp( temp_output_989_0_g39592 , temp_cast_67 , MASK_HORIZONTAL808_g39592);
			float m_Active1075_g39592 = lerpResult1030_g39592.x;
			float m_ActiveInverted1075_g39592 = lerpResult1030_g39592.x;
			float localfloatswitch1075_g39592 = floatswitch1075_g39592( m_switch1075_g39592 , m_Off1075_g39592 , m_Active1075_g39592 , m_ActiveInverted1075_g39592 );
			float m_Off1432_g39592 = localfloatswitch1075_g39592;
			float FINAL_MASKSMOOTHNESS_VERTICAL1023_g39592 = _Verticalwear_Smoothness;
			float lerpResult1028_g39592 = lerp( localfloatswitch1075_g39592 , FINAL_MASKSMOOTHNESS_VERTICAL1023_g39592 , MASK_VERTICAL602_g39592);
			float m_Active1432_g39592 = lerpResult1028_g39592;
			float m_ActiveInverted1432_g39592 = lerpResult1028_g39592;
			float localfloatswitch1432_g39592 = floatswitch1432_g39592( m_switch1432_g39592 , m_Off1432_g39592 , m_Active1432_g39592 , m_ActiveInverted1432_g39592 );
			float m_Off1433_g39592 = localfloatswitch1432_g39592;
			float4 SMOOTHNESS_IN1554_g39592 = temp_output_989_0_g39592;
			float4 temp_cast_70 = (_Curvaturewear_Smoothness).xxxx;
			float4 lerpResult1552_g39592 = lerp( SMOOTHNESS_IN1554_g39592 , temp_cast_70 , _Curvaturewear_BlendMix);
			float4 FINAL_MASKSMOOTHNESS_CURVATURE1021_g39592 = lerpResult1552_g39592;
			float4 temp_cast_71 = (localfloatswitch1432_g39592).xxxx;
			float4 lerpResult1031_g39592 = lerp( FINAL_MASKSMOOTHNESS_CURVATURE1021_g39592 , temp_cast_71 , MASK_CURVATURE401_g39592);
			float m_Active1433_g39592 = lerpResult1031_g39592.x;
			float m_ActiveInverted1433_g39592 = lerpResult1031_g39592.x;
			float localfloatswitch1433_g39592 = floatswitch1433_g39592( m_switch1433_g39592 , m_Off1433_g39592 , m_Active1433_g39592 , m_ActiveInverted1433_g39592 );
			o.Smoothness = localfloatswitch1433_g39592;
			o.Occlusion = saturate( lerpResult14_g38027 ).r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=18913
486;116;1467;857;-146.1956;975.2816;1.309121;True;False
Node;AmplifyShaderEditor.CommentaryNode;290;1377.96,-881.2607;Inherit;False;355.0839;184.8745;DEBUG SETTINGS ;3;293;353;291;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;295;1379.783,-1014.665;Inherit;False;161.0676;122.6909;GLOBAL SETTINGS ;1;294;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;464;1380.689,-260.329;Inherit;False;337;119.5;DESF Common ASE Compile Shaders;1;465;;0,0.2605708,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode;521;591.5883,-685.696;Inherit;False;DESF Core Surface;3;;38027;c3df20d62907cd04086a1eacc41e29d1;19,1352,0,183,0,1382,1,1432,1,1433,1,1434,1,1491,0,1284,2,1446,0,307,0,312,0,1318,0,249,0,1319,0,1336,0,1337,0,1407,0,1443,0,1444,0;2;309;FLOAT3;0,0,0;False;1262;FLOAT4;0,0,0,0;False;10;FLOAT4;42;FLOAT3;39;FLOAT3;1473;COLOR;0;FLOAT4;41;COLOR;43;FLOAT;180;FLOAT;55;FLOAT;281;FLOAT3;313
Node;AmplifyShaderEditor.IntNode;291;1387.189,-839.5454;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;353;1391.431,-768.1531;Inherit;False;Constant;_MaskClipValue1;Mask Clip Value;14;0;Create;True;1;;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;294;1396.596,-970.853;Inherit;False;Property;_CullMode;Cull Mode;2;2;[Header];[Enum];Create;True;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;2;False;0;1;INT;0
Node;AmplifyShaderEditor.FunctionNode;465;1398.689,-221.329;Inherit;False;DESF Common ASE Compile Shaders;-1;;39591;b85b01c42ba8a8a448b731b68fc0dbd9;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;520;1020.727,-680.729;Inherit;False;DESF Module Grunge;66;;39592;b0925d725c9bfd049b8ad9f4b41a5bd0;3,1487,0,1466,0,1473,0;4;6;FLOAT4;0,0,0,0;False;8;FLOAT3;0,0,0;False;977;FLOAT4;0,0,0,0;False;989;FLOAT4;0,0,0,0;False;4;FLOAT4;0;FLOAT3;9;FLOAT;991;FLOAT;990
Node;AmplifyShaderEditor.IntNode;293;1577.986,-840.0272;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;1;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;194;1374.904,-680.6909;Float;False;True;-1;6;;200;0;Standard;DEC/Grunge/Grunge Surface Mask Texture;False;False;False;False;False;False;False;False;False;False;False;False;True;False;True;False;False;False;True;True;True;Back;0;True;293;3;False;292;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;True;-10;True;Opaque;;Geometry;All;18;all;True;True;True;True;0;True;291;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;0;1;0;5;False;0.5;True;0;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;200;;-1;-1;-1;-1;1;NatureRendererInstancing=True;False;0;0;True;294;-1;0;True;353;5;Pragma;multi_compile_instancing;False;;Custom;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;;Custom;Include;Nature Renderer.cginc;False;5d792e02fd6741e4cb63087f97979470;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom;0;0;False;0.1;False;-1;0;False;-1;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;520;6;521;42
WireConnection;520;8;521;39
WireConnection;520;977;521;0
WireConnection;520;989;521;41
WireConnection;194;0;520;0
WireConnection;194;1;520;9
WireConnection;194;3;520;991
WireConnection;194;4;520;990
WireConnection;194;5;521;43
ASEEND*/
//CHKSM=017397974E08CBD89E794F2E88DF2C829EB8183F