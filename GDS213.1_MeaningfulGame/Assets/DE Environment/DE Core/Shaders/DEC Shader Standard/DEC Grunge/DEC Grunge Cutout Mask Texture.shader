// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Grunge/Grunge Cutout Mask Texture"
{
	Properties
	{
		[Header(DEBUG SETTINGS)][Enum(Off,0,On,1)]_ZWriteMode("ZWrite Mode", Int) = 1
		[Enum(None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15)]_ColorMask("Color Mask Mode", Int) = 15
		[Enum(Off,0,On,1)]_AlphatoCoverage("Alpha to Coverage", Float) = 0
		[Header(GLOBAL SETTINGS)][Enum(UnityEngine.Rendering.CullMode)]_CullMode("Cull Mode", Int) = 0
		[Enum(Default,0,Flip,1,Mirror,2)]_NormalMode("Normal Mode", Int) = 0
		[Enum(Off,0,Active,1)]_GlancingClipMode("Clip Glancing Angle Mode", Int) = 1
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
		_AlphaCutoffBias("Alpha Cutoff Bias", Range( 0 , 1)) = 0.5
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
		_OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0.25
		[SingleLineTexture]_SmoothnessMap("Smoothness Map", 2D) = "white" {}
		[Enum(Standard,0,Geometric,1,Geometric Fade,2,Texture,3)]_SmoothnessModeCutout("Smoothness Mode", Int) = 3
		[Enum(Smoothness,0,Roughness,1)]_SmoothnessType("Smoothness Type", Int) = 0
		_SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0.1
		_SmoothnessThreshold("Smoothness Threshold", Range( 0 , 0.5)) = 0
		_SmoothnessVariance("Smoothness Variance", Range( 0 , 1)) = 0.2
		[HideInInspector]_MaskClipValue("Mask Clip Value", Float) = 0.5
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
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
		Tags{ "RenderType" = "Opaque"  "Queue" = "Geometry-10" "NatureRendererInstancing"="True" }
		LOD 200
		Cull [_CullMode]
		ZWrite [_ZWriteMode]
		ZTest LEqual
		AlphaToMask [_AlphatoCoverage]
		ColorMask [_ColorMask]
		CGPROGRAM
		#include "UnityStandardUtils.cginc"
		#include "UnityShaderVariables.cginc"
		#pragma target 3.5
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
			half ASEVFace : VFACE;
			float3 worldNormal;
			INTERNAL_DATA
			float3 worldPos;
			float4 vertexColor : COLOR;
		};

		uniform int _CullMode;
		uniform float _AlphatoCoverage;
		uniform int _ZWriteMode;
		uniform int _ColorMask;
		uniform int _Curvaturewear_Mode;
		uniform int _Verticalwear_Mode;
		uniform int _Horizontalwear_Mode;
		uniform int _NormalMode;
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
		uniform int _SmoothnessModeCutout;
		uniform float _SmoothnessStrength;
		uniform float _SmoothnessVariance;
		uniform float _SmoothnessThreshold;
		uniform half _AlphaCutoffBias;
		uniform int _SmoothnessType;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_SmoothnessMap);
		UNITY_DECLARE_TEX2D_NOSAMPLER(_OcclusionMap);
		uniform int _OcclusionSourceMode;
		uniform float _OcclusionStrengthAO;
		uniform float _Horizontalwear_Smoothness;
		uniform float _Verticalwear_Smoothness;
		uniform float _Curvaturewear_Smoothness;
		uniform int _GlancingClipMode;
		uniform float _MaskClipValue;


		float4 mod289( float4 x )
		{
			return x - floor(x * (1.0 / 289.0)) * 289.0;
		}


		float4 perm( float4 x )
		{
			return mod289(((x * 34.0) + 1.0) * x);
		}


		float SimpleNoise3D( float3 p )
		{
			 float3 a = floor(p);
			    float3 d = p - a;
			    d = d * d * (3.0 - 2.0 * d);
			 float4 b = a.xxyy + float4(0.0, 1.0, 0.0, 1.0);
			    float4 k1 = perm(b.xyxy);
			 float4 k2 = perm(k1.xyxy + b.zzww);
			    float4 c = k2 + a.zzzz;
			    float4 k3 = perm(c);
			    float4 k4 = perm(c + 1.0);
			    float4 o1 = frac(k3 * (1.0 / 41.0));
			 float4 o2 = frac(k4 * (1.0 / 41.0));
			    float4 o3 = o2 * d.z + o1 * (1.0 - d.z);
			    float2 o4 = o3.yw * d.x + o3.xz * (1.0 - d.x);
			    return o4.y * d.y + o4.x * (1.0 - d.y);
		}


		float3 float3switch37_g39824( int m_switch, float3 m_Default, float3 m_Flip, float3 m_Mirror )
		{
			if(m_switch ==0)
				return m_Default;
			else if(m_switch ==1)
				return m_Flip;
			else if(m_switch ==2)
				return m_Mirror;
			else
			return float3(0,0,0);
		}


		float4 float4switch1476_g39827( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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


		float3 float3switch1329_g39827( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveInverted )
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


		float4 float4switch1400_g39827( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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


		float3 float3switch1413_g39827( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveInverted )
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


		float4 float4switch1491_g39827( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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


		float3 float3switch1416_g39827( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveInverted )
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


		float4 float4switch143_g39811( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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


		float4 float4switch1269_g39827( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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


		float4 float4switch1377_g39827( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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


		float4 float4switch1380_g39827( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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


		float floatswitch1434_g39827( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
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


		float floatswitch1435_g39827( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
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


		float floatswitch1436_g39827( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
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


		float4 float4switch189_g39758( int m_switch, float4 m_Smoothness, float4 m_Roughness )
		{
			if(m_switch ==0)
				return m_Smoothness;
			else if(m_switch ==1)
				return m_Roughness;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch188_g39758( int m_switch, float4 m_Standard, float4 m_Geometric, float4 m_GeometricFade, float4 m_Texture )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Geometric;
			else if(m_switch ==2)
				return m_GeometricFade;
			else if(m_switch ==3)
				return m_Texture;
			else
			return float4(0,0,0,0);
		}


		float floatswitch1075_g39827( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
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


		float floatswitch1432_g39827( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
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


		float floatswitch1433_g39827( int m_switch, float m_Off, float m_Active, float m_ActiveInverted )
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


		float floatswitch1287_g37919( int m_switch, float m_Off, float m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float(0);
		}


		void surf( Input i , inout SurfaceOutputStandard o )
		{
			int m_switch1416_g39827 = _Curvaturewear_Mode;
			int m_switch1413_g39827 = _Verticalwear_Mode;
			int m_switch1329_g39827 = _Horizontalwear_Mode;
			int m_switch37_g39824 = _NormalMode;
			float2 appendResult168_g37919 = (float2(_TilingX , _TilingY));
			float2 appendResult167_g37919 = (float2(_OffsetX , _OffsetY));
			float2 uv_TexCoord2_g39802 = i.uv_texcoord * appendResult168_g37919 + appendResult167_g37919;
			float2 appendResult6_g39802 = (float2(uv_TexCoord2_g39802.x , uv_TexCoord2_g39802.y));
			float2 OUT_UV213_g37919 = appendResult6_g39802;
			float2 UV40_g39808 = OUT_UV213_g37919;
			float4 NORMAL_RGB1382_g37919 = SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, UV40_g39808 );
			float4 temp_output_1_0_g39806 = NORMAL_RGB1382_g37919;
			float temp_output_8_0_g39806 = _NormalStrength;
			float3 temp_output_1519_59_g37919 = UnpackScaleNormal( temp_output_1_0_g39806, temp_output_8_0_g39806 );
			float3 NORMAL_IN42_g39824 = temp_output_1519_59_g37919;
			float3 m_Default37_g39824 = NORMAL_IN42_g39824;
			float3 m_Flip37_g39824 = ( NORMAL_IN42_g39824 * i.ASEVFace );
			float3 break33_g39824 = NORMAL_IN42_g39824;
			float3 appendResult41_g39824 = (float3(break33_g39824.x , break33_g39824.y , ( break33_g39824.z * i.ASEVFace )));
			float3 m_Mirror37_g39824 = appendResult41_g39824;
			float3 localfloat3switch37_g39824 = float3switch37_g39824( m_switch37_g39824 , m_Default37_g39824 , m_Flip37_g39824 , m_Mirror37_g39824 );
			float3 temp_output_1610_30_g37919 = localfloat3switch37_g39824;
			float3 temp_output_8_0_g39827 = temp_output_1610_30_g37919;
			float3 m_Off1329_g39827 = temp_output_8_0_g39827;
			float2 appendResult1344_g39827 = (float2(_Horizontalwear_TilingX , _Horizontalwear_TilingY));
			float2 appendResult1343_g39827 = (float2(_Horizontalwear_OffsetX , _Horizontalwear_OffsetY));
			float2 uv_TexCoord1342_g39827 = i.uv_texcoord * appendResult1344_g39827 + appendResult1343_g39827;
			float4 temp_output_1_0_g39840 = SAMPLE_TEXTURE2D( _Horizontalwear_GrungeNormal, sampler_trilinear_repeat, uv_TexCoord1342_g39827 );
			float temp_output_8_0_g39840 = ( _Horizontalwear_NormalMultiplier * _Horizontalwear_BlendStrength );
			float3 FINAL_MASKNORMAL_HORIZONTAL803_g39827 = UnpackScaleNormal( temp_output_1_0_g39840, temp_output_8_0_g39840 );
			float4 temp_cast_2 = (0.5).xxxx;
			float4 temp_cast_3 = (0.75).xxxx;
			int _Horizontalwear_Mode1003_g39827 = _Horizontalwear_Mode;
			int m_switch1476_g39827 = _Horizontalwear_Mode1003_g39827;
			float cos1_g39850 = cos( radians( _Horizontalwear_Rotation ) );
			float sin1_g39850 = sin( radians( _Horizontalwear_Rotation ) );
			float2 rotator1_g39850 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos1_g39850 , -sin1_g39850 , sin1_g39850 , cos1_g39850 )) + float2( 0.5,0.5 );
			float2 appendResult811_g39827 = (float2(_Horizontalwear_TilingXMask , _Horizontalwear_TilingYMask));
			float2 appendResult1164_g39827 = (float2(_Horizontalwear_OffsetXMask , _Horizontalwear_OffsetYMask));
			float4 m_Off1476_g39827 = SAMPLE_TEXTURE2D( _Horizontalwear_GrungeMask, sampler_trilinear_repeat, (rotator1_g39850*appendResult811_g39827 + appendResult1164_g39827) );
			float4 m_Active1476_g39827 = SAMPLE_TEXTURE2D( _Horizontalwear_GrungeMask, sampler_trilinear_repeat, (rotator1_g39850*appendResult811_g39827 + appendResult1164_g39827) );
			float4 m_ActiveInverted1476_g39827 = saturate( ( 1.0 - SAMPLE_TEXTURE2D( _Horizontalwear_GrungeMask, sampler_trilinear_repeat, (rotator1_g39850*appendResult811_g39827 + appendResult1164_g39827) ) ) );
			float4 localfloat4switch1476_g39827 = float4switch1476_g39827( m_switch1476_g39827 , m_Off1476_g39827 , m_Active1476_g39827 , m_ActiveInverted1476_g39827 );
			float4 temp_output_44_0_g39857 = localfloat4switch1476_g39827;
			float4 VECTOR_IN212_g39857 = temp_output_44_0_g39857;
			float4 _Vec = float4(0.001,0.001,0.001,0.001);
			float4 Vect_0019_g39857 = _Vec;
			float2 _SmoothHorizontal = float2(0,0.5);
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 temp_output_40_0_g39857 = abs( ase_worldNormal );
			float WN_HORIZONTAL141_g39857 = ( ( temp_output_40_0_g39857 * temp_output_40_0_g39857 ).y + 0.07 );
			float smoothstepResult205_g39857 = smoothstep( _SmoothHorizontal.x , _SmoothHorizontal.y , ( ( 1.0 - WN_HORIZONTAL141_g39857 ) + -0.1 ));
			float4 lerpResult200_g39857 = lerp( VECTOR_IN212_g39857 , Vect_0019_g39857 , smoothstepResult205_g39857);
			float4 MASK_HORIZONTAL204_g39857 = lerpResult200_g39857;
			float4 temp_cast_7 = (_Horizontalwear_BlendStrength).xxxx;
			float4 temp_cast_8 = (-1.0).xxxx;
			float4 smoothstepResult75_g39857 = smoothstep( temp_cast_2 , temp_cast_3 , (float4( 0,0,0,0 ) + (( 1.0 - MASK_HORIZONTAL204_g39857 ) - temp_cast_7) * (temp_cast_8 - float4( 0,0,0,0 )) / (float4( 1,1,1,1 ) - temp_cast_7)));
			float4 _MinOldVect4 = float4(0,0,0,0);
			float MASK_HORIZONTAL808_g39827 = ( (( ( smoothstepResult75_g39857 - _MinOldVect4 ) / ( float4(1,1,1,1) - _MinOldVect4 ) )).x * _Horizontalwear_BlendMix );
			float3 lerpResult1335_g39827 = lerp( temp_output_8_0_g39827 , FINAL_MASKNORMAL_HORIZONTAL803_g39827 , MASK_HORIZONTAL808_g39827);
			float3 m_Active1329_g39827 = lerpResult1335_g39827;
			float3 m_ActiveInverted1329_g39827 = lerpResult1335_g39827;
			float3 localfloat3switch1329_g39827 = float3switch1329_g39827( m_switch1329_g39827 , m_Off1329_g39827 , m_Active1329_g39827 , m_ActiveInverted1329_g39827 );
			float3 m_Off1413_g39827 = localfloat3switch1329_g39827;
			float2 appendResult1384_g39827 = (float2(_Verticalwear_TilingX , _Verticalwear_TilingY));
			float2 appendResult1386_g39827 = (float2(_Verticalwear_OffsetX , _Verticalwear_OffsetY));
			float2 uv_TexCoord1388_g39827 = i.uv_texcoord * appendResult1384_g39827 + appendResult1386_g39827;
			float4 temp_output_1_0_g39838 = SAMPLE_TEXTURE2D( _Verticalwear_GrungeNormal, sampler_trilinear_repeat, uv_TexCoord1388_g39827 );
			float temp_output_8_0_g39838 = ( _Verticalwear_NormalMultiplier * _Verticalwear_BlendStrength );
			float3 FINAL_MASKNORMAL_VERTICAL630_g39827 = UnpackScaleNormal( temp_output_1_0_g39838, temp_output_8_0_g39838 );
			float4 temp_cast_10 = (0.5).xxxx;
			float4 temp_cast_11 = (0.75).xxxx;
			int _Verticalwear_Mode1004_g39827 = _Verticalwear_Mode;
			int m_switch1400_g39827 = _Verticalwear_Mode1004_g39827;
			float cos1_g39844 = cos( radians( _Verticalwear_Rotation ) );
			float sin1_g39844 = sin( radians( _Verticalwear_Rotation ) );
			float2 rotator1_g39844 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos1_g39844 , -sin1_g39844 , sin1_g39844 , cos1_g39844 )) + float2( 0.5,0.5 );
			float2 appendResult41_g39827 = (float2(_Verticalwear_TilingXMask , _Verticalwear_TilingYMask));
			float2 appendResult1165_g39827 = (float2(_Verticalwear_OffsetXMask , _Verticalwear_OffsetYMask));
			float4 m_Off1400_g39827 = SAMPLE_TEXTURE2D( _Verticalwear_GrungeMask, sampler_trilinear_repeat, (rotator1_g39844*appendResult41_g39827 + appendResult1165_g39827) );
			float4 m_Active1400_g39827 = SAMPLE_TEXTURE2D( _Verticalwear_GrungeMask, sampler_trilinear_repeat, (rotator1_g39844*appendResult41_g39827 + appendResult1165_g39827) );
			float4 m_ActiveInverted1400_g39827 = saturate( ( 1.0 - SAMPLE_TEXTURE2D( _Verticalwear_GrungeMask, sampler_trilinear_repeat, (rotator1_g39844*appendResult41_g39827 + appendResult1165_g39827) ) ) );
			float4 localfloat4switch1400_g39827 = float4switch1400_g39827( m_switch1400_g39827 , m_Off1400_g39827 , m_Active1400_g39827 , m_ActiveInverted1400_g39827 );
			float4 temp_output_44_0_g39828 = localfloat4switch1400_g39827;
			float3 temp_output_40_0_g39828 = abs( ase_worldNormal );
			float WN_HORIZONTAL141_g39828 = ( ( temp_output_40_0_g39828 * temp_output_40_0_g39828 ).y + 0.07 );
			float4 lerpResult2_g39828 = lerp( temp_output_44_0_g39828 , _Vec , WN_HORIZONTAL141_g39828);
			float4 VECTOR_IN_MASKED112_g39828 = lerpResult2_g39828;
			float4 Vect_0019_g39828 = _Vec;
			float3 break349_g39828 = ase_worldNormal;
			float WN_NY173_g39828 = break349_g39828.y;
			float WN_NZ184_g39828 = break349_g39828.z;
			float WN_NX186_g39828 = break349_g39828.x;
			float temp_output_175_0_g39828 = ( -WN_NY173_g39828 + WN_NZ184_g39828 + -WN_NX186_g39828 );
			float4 lerpResult133_g39828 = lerp( VECTOR_IN_MASKED112_g39828 , Vect_0019_g39828 , ( temp_output_175_0_g39828 + -temp_output_175_0_g39828 + 0.07 ));
			float4 MASK_SIDE163_g39828 = lerpResult133_g39828;
			float4 temp_cast_15 = (_Verticalwear_BlendStrength).xxxx;
			float4 temp_cast_16 = (-2.0).xxxx;
			float4 smoothstepResult75_g39828 = smoothstep( temp_cast_10 , temp_cast_11 , (float4( 0,0,0,0 ) + (( 1.0 - MASK_SIDE163_g39828 ) - temp_cast_15) * (temp_cast_16 - float4( 0,0,0,0 )) / (float4( 1,1,1,1 ) - temp_cast_15)));
			float MASK_VERTICAL602_g39827 = ( (( ( smoothstepResult75_g39828 - _MinOldVect4 ) / ( float4(1,1,1,1) - _MinOldVect4 ) )).x * _Verticalwear_BlendMix );
			float3 lerpResult1414_g39827 = lerp( localfloat3switch1329_g39827 , FINAL_MASKNORMAL_VERTICAL630_g39827 , MASK_VERTICAL602_g39827);
			float3 m_Active1413_g39827 = lerpResult1414_g39827;
			float3 m_ActiveInverted1413_g39827 = lerpResult1414_g39827;
			float3 localfloat3switch1413_g39827 = float3switch1413_g39827( m_switch1413_g39827 , m_Off1413_g39827 , m_Active1413_g39827 , m_ActiveInverted1413_g39827 );
			float3 m_Off1416_g39827 = localfloat3switch1413_g39827;
			float3 NORMAL_IN1546_g39827 = temp_output_8_0_g39827;
			float2 appendResult1393_g39827 = (float2(_Curvaturewear_TilingX , _Curvaturewear_TilingY));
			float2 appendResult1390_g39827 = (float2(_Curvaturewear_OffsetX , _Curvaturewear_OffsetY));
			float2 uv_TexCoord1389_g39827 = i.uv_texcoord * appendResult1393_g39827 + appendResult1390_g39827;
			float4 temp_output_1_0_g39832 = SAMPLE_TEXTURE2D( _Curvaturewear_GrungeNormal, sampler_trilinear_repeat, uv_TexCoord1389_g39827 );
			float temp_output_8_0_g39832 = ( _Curvaturewear_NormalMultiplier * _Curvaturewear_BlendStrength );
			float3 lerpResult1537_g39827 = lerp( NORMAL_IN1546_g39827 , UnpackScaleNormal( temp_output_1_0_g39832, temp_output_8_0_g39832 ) , _Curvaturewear_BlendMix);
			float3 FINAL_MASKNORMAL_CURVATURE599_g39827 = lerpResult1537_g39827;
			float4 temp_cast_18 = (0.5).xxxx;
			float4 temp_cast_19 = (0.75).xxxx;
			int _Curvaturewear_Mode398_g39827 = _Curvaturewear_Mode;
			int m_switch1491_g39827 = _Curvaturewear_Mode398_g39827;
			float cos1_g39859 = cos( radians( _Curvaturewear_Rotation ) );
			float sin1_g39859 = sin( radians( _Curvaturewear_Rotation ) );
			float2 rotator1_g39859 = mul( i.uv_texcoord - float2( 0.5,0.5 ) , float2x2( cos1_g39859 , -sin1_g39859 , sin1_g39859 , cos1_g39859 )) + float2( 0.5,0.5 );
			float2 appendResult38_g39827 = (float2(_Curvaturewear_TilingXMask , _Curvaturewear_TilingYMask));
			float2 appendResult1168_g39827 = (float2(_Curvaturewear_OffsetXMask , _Curvaturewear_OffsetYMask));
			float4 m_Off1491_g39827 = SAMPLE_TEXTURE2D( _Curvaturewear_GrungeMask, sampler_trilinear_repeat, (rotator1_g39859*appendResult38_g39827 + appendResult1168_g39827) );
			float4 m_Active1491_g39827 = SAMPLE_TEXTURE2D( _Curvaturewear_GrungeMask, sampler_trilinear_repeat, (rotator1_g39859*appendResult38_g39827 + appendResult1168_g39827) );
			float4 m_ActiveInverted1491_g39827 = saturate( ( 1.0 - SAMPLE_TEXTURE2D( _Curvaturewear_GrungeMask, sampler_trilinear_repeat, (rotator1_g39859*appendResult38_g39827 + appendResult1168_g39827) ) ) );
			float4 localfloat4switch1491_g39827 = float4switch1491_g39827( m_switch1491_g39827 , m_Off1491_g39827 , m_Active1491_g39827 , m_ActiveInverted1491_g39827 );
			float4 temp_output_44_0_g39836 = localfloat4switch1491_g39827;
			float3 temp_output_40_0_g39836 = abs( ase_worldNormal );
			float WN_HORIZONTAL141_g39836 = ( ( temp_output_40_0_g39836 * temp_output_40_0_g39836 ).y + 0.07 );
			float4 lerpResult2_g39836 = lerp( temp_output_44_0_g39836 , _Vec , WN_HORIZONTAL141_g39836);
			float4 VECTOR_IN_MASKED112_g39836 = lerpResult2_g39836;
			float4 Vect_0019_g39836 = _Vec;
			float2 _SmoothX = float2(0,0.45);
			float3 temp_cast_23 = (0.5).xxx;
			float3 break24_g39836 = ( temp_output_40_0_g39836 - temp_cast_23 );
			float WN_X134_g39836 = break24_g39836.x;
			float smoothstepResult8_g39836 = smoothstep( _SmoothX.x , _SmoothX.y , ( WN_X134_g39836 + 1.25 ));
			float smoothstepResult22_g39836 = smoothstep( _SmoothX.x , _SmoothX.y , ( -WN_X134_g39836 + 0.02 ));
			float lerpResult11_g39836 = lerp( 0.0 , smoothstepResult8_g39836 , smoothstepResult22_g39836);
			float4 lerpResult14_g39836 = lerp( VECTOR_IN_MASKED112_g39836 , Vect_0019_g39836 , lerpResult11_g39836);
			float4 MASK_VERTICAL_X159_g39836 = lerpResult14_g39836;
			float2 _SmoothY = float2(0,0.85);
			float WN_Y135_g39836 = break24_g39836.y;
			float smoothstepResult29_g39836 = smoothstep( _SmoothY.x , _SmoothY.y , ( -WN_Y135_g39836 + 0.35 ));
			float4 lerpResult6_g39836 = lerp( VECTOR_IN_MASKED112_g39836 , Vect_0019_g39836 , smoothstepResult29_g39836);
			float4 MASK_VERTICAL_Y157_g39836 = lerpResult6_g39836;
			float2 _SmoothZ = float2(1.8,1.4);
			float WN_Z136_g39836 = break24_g39836.z;
			float smoothstepResult26_g39836 = smoothstep( _SmoothZ.x , _SmoothZ.y , ( WN_Z136_g39836 + 2.06 ));
			float lerpResult34_g39836 = lerp( smoothstepResult26_g39836 , 0.0 , ( -WN_Z136_g39836 + 2.05 ));
			float4 lerpResult5_g39836 = lerp( Vect_0019_g39836 , VECTOR_IN_MASKED112_g39836 , lerpResult34_g39836);
			float4 MASK_VERTICAL_Z155_g39836 = lerpResult5_g39836;
			float4 temp_cast_24 = (_Curvaturewear_BlendStrength).xxxx;
			float4 temp_cast_25 = (_Curvaturewear_BlendHardness).xxxx;
			float4 smoothstepResult75_g39836 = smoothstep( temp_cast_18 , temp_cast_19 , (float4( 0,0,0,0 ) + (( 1.0 - ( MASK_VERTICAL_X159_g39836 + MASK_VERTICAL_Y157_g39836 + MASK_VERTICAL_Z155_g39836 ) ) - temp_cast_24) * (temp_cast_25 - float4( 0,0,0,0 )) / (float4( 1,1,1,1 ) - temp_cast_24)));
			float MASK_CURVATURE401_g39827 = (( ( smoothstepResult75_g39836 - _MinOldVect4 ) / ( float4(1,1,1,1) - _MinOldVect4 ) )).x;
			float3 lerpResult1417_g39827 = lerp( FINAL_MASKNORMAL_CURVATURE599_g39827 , localfloat3switch1413_g39827 , MASK_CURVATURE401_g39827);
			float3 m_Active1416_g39827 = lerpResult1417_g39827;
			float3 m_ActiveInverted1416_g39827 = lerpResult1417_g39827;
			float3 localfloat3switch1416_g39827 = float3switch1416_g39827( m_switch1416_g39827 , m_Off1416_g39827 , m_Active1416_g39827 , m_ActiveInverted1416_g39827 );
			o.Normal = localfloat3switch1416_g39827;
			int m_switch1380_g39827 = _Curvaturewear_Mode;
			int m_switch1377_g39827 = _Verticalwear_Mode;
			int m_switch1269_g39827 = _Horizontalwear_Mode;
			int _Gradient_Mode161_g39811 = _Gradient_Mode;
			int m_switch143_g39811 = _Gradient_Mode161_g39811;
			float4 TINT147_g39811 = _Color;
			float4 m_Off143_g39811 = TINT147_g39811;
			float4 _Vector0 = float4(0.001,0.001,0.001,0.001);
			float3 temp_output_275_0_g39811 = abs( ase_worldNormal );
			float WN_HORIZONTAL284_g39811 = ( ( temp_output_275_0_g39811 * temp_output_275_0_g39811 ).y + 0.07 );
			float4 lerpResult341_g39811 = lerp( _Gradient_TintCurvature , _Vector0 , WN_HORIZONTAL284_g39811);
			float4 VECTOR_IN_MASKED343_g39811 = lerpResult341_g39811;
			float4 Vect_001349_g39811 = _Vector0;
			float2 _Vector3 = float2(0,0.45);
			float3 temp_cast_28 = (0.5).xxx;
			float3 break277_g39811 = ( temp_output_275_0_g39811 - temp_cast_28 );
			float WN_X280_g39811 = break277_g39811.x;
			float smoothstepResult303_g39811 = smoothstep( _Vector3.x , _Vector3.y , ( WN_X280_g39811 + 1.25 ));
			float smoothstepResult299_g39811 = smoothstep( _Vector3.x , _Vector3.y , ( -WN_X280_g39811 + 0.02 ));
			float lerpResult306_g39811 = lerp( 0.0 , smoothstepResult303_g39811 , smoothstepResult299_g39811);
			float4 lerpResult301_g39811 = lerp( VECTOR_IN_MASKED343_g39811 , Vect_001349_g39811 , lerpResult306_g39811);
			float4 MASK_VERTICAL_X307_g39811 = lerpResult301_g39811;
			float2 _Vector1 = float2(0,0.85);
			float WN_Y281_g39811 = break277_g39811.y;
			float smoothstepResult334_g39811 = smoothstep( _Vector1.x , _Vector1.y , ( -WN_Y281_g39811 + 0.35 ));
			float4 lerpResult333_g39811 = lerp( VECTOR_IN_MASKED343_g39811 , Vect_001349_g39811 , smoothstepResult334_g39811);
			float4 MASK_VERTICAL_Y320_g39811 = lerpResult333_g39811;
			float2 _HelloRicardo = float2(1.8,1.4);
			float WN_Z282_g39811 = break277_g39811.z;
			float smoothstepResult331_g39811 = smoothstep( _HelloRicardo.x , _HelloRicardo.y , ( WN_Z282_g39811 + 2.06 ));
			float lerpResult327_g39811 = lerp( smoothstepResult331_g39811 , 0.0 , ( -WN_Z282_g39811 + 2.05 ));
			float4 lerpResult314_g39811 = lerp( Vect_001349_g39811 , VECTOR_IN_MASKED343_g39811 , lerpResult327_g39811);
			float4 MASK_VERTICAL_Z315_g39811 = lerpResult314_g39811;
			float4 Curvature353_g39811 = saturate( ( MASK_VERTICAL_X307_g39811 + MASK_VERTICAL_Y320_g39811 + MASK_VERTICAL_Z315_g39811 ) );
			float4 lerpResult117_g39811 = lerp( _Gradient_BottomSide , _Gradient_Bottom , WN_HORIZONTAL284_g39811);
			float4 lerpResult111_g39811 = lerp( _Gradient_TopSide , _Gradient_Top , WN_HORIZONTAL284_g39811);
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float clampResult106_g39811 = clamp( ( ase_vertex3Pos.y / _Gradient_Height ) , 0.0 , 1.0 );
			float4 lerpResult113_g39811 = lerp( lerpResult117_g39811 , lerpResult111_g39811 , clampResult106_g39811);
			float3 temp_output_145_0_g39811 = (( Curvature353_g39811 + lerpResult113_g39811 )).xyz;
			float _Gradient_Ramp154_g39811 = _Gradient_Ramp;
			float _Gradient_Contrast157_g39811 = _Gradient_Contrast;
			float4 tex2DNode63_g39808 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g39808 );
			float4 ALBEDO_RGBA1381_g37919 = tex2DNode63_g39808;
			float4 ALBEDO151_g39811 = ALBEDO_RGBA1381_g37919;
			float smoothstepResult142_g39811 = smoothstep( ( _Gradient_Ramp154_g39811 - ( _Gradient_Ramp154_g39811 * ( 1.0 - _Gradient_Contrast157_g39811 ) ) ) , ALBEDO151_g39811.x , _Gradient_Ramp154_g39811);
			float4 lerpResult139_g39811 = lerp( TINT147_g39811 , float4( temp_output_145_0_g39811 , 0.0 ) , smoothstepResult142_g39811);
			float4 m_Active143_g39811 = lerpResult139_g39811;
			float4 lerpResult141_g39811 = lerp( float4( temp_output_145_0_g39811 , 0.0 ) , TINT147_g39811 , smoothstepResult142_g39811);
			float4 m_ActiveInverted143_g39811 = lerpResult141_g39811;
			float4 localfloat4switch143_g39811 = float4switch143_g39811( m_switch143_g39811 , m_Off143_g39811 , m_Active143_g39811 , m_ActiveInverted143_g39811 );
			float4 temp_output_3_0_g37919 = ( localfloat4switch143_g39811 * float4( (ALBEDO_RGBA1381_g37919).rgb , 0.0 ) * _Brightness );
			float4 temp_output_6_0_g39827 = ( temp_output_3_0_g37919 + float4(0,0,0,0) );
			float4 m_Off1269_g39827 = temp_output_6_0_g39827;
			float4 tex2DNode1327_g39827 = SAMPLE_TEXTURE2D( _Horizontalwear_GrungeMap, sampler_trilinear_repeat, uv_TexCoord1342_g39827 );
			float4 temp_output_12_0_g39830 = ( float4( (_Horizontalwear_Tint).rgb , 0.0 ) * tex2DNode1327_g39827 );
			float3 desaturateInitialColor10_g39830 = temp_output_12_0_g39830.xyz;
			float desaturateDot10_g39830 = dot( desaturateInitialColor10_g39830, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar10_g39830 = lerp( desaturateInitialColor10_g39830, desaturateDot10_g39830.xxx, ( 1.0 - ( _Horizontalwear_Saturation + 1.0 ) ) );
			float3 FINAL_MASK_HORIZONTAL804_g39827 = desaturateVar10_g39830;
			float4 lerpResult861_g39827 = lerp( temp_output_6_0_g39827 , float4( FINAL_MASK_HORIZONTAL804_g39827 , 0.0 ) , MASK_HORIZONTAL808_g39827);
			float4 m_Active1269_g39827 = lerpResult861_g39827;
			float4 m_ActiveInverted1269_g39827 = lerpResult861_g39827;
			float4 localfloat4switch1269_g39827 = float4switch1269_g39827( m_switch1269_g39827 , m_Off1269_g39827 , m_Active1269_g39827 , m_ActiveInverted1269_g39827 );
			float4 m_Off1377_g39827 = localfloat4switch1269_g39827;
			float4 tex2DNode1397_g39827 = SAMPLE_TEXTURE2D( _Verticalwear_GrungeMap, sampler_trilinear_repeat, uv_TexCoord1388_g39827 );
			float4 temp_output_12_0_g39842 = ( float4( (_Verticalwear_Tint).rgb , 0.0 ) * tex2DNode1397_g39827 );
			float3 desaturateInitialColor10_g39842 = temp_output_12_0_g39842.xyz;
			float desaturateDot10_g39842 = dot( desaturateInitialColor10_g39842, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar10_g39842 = lerp( desaturateInitialColor10_g39842, desaturateDot10_g39842.xxx, ( 1.0 - ( _Verticalwear_Saturation + 1.0 ) ) );
			float3 FINAL_MASK_VERTICAL394_g39827 = desaturateVar10_g39842;
			float4 lerpResult1227_g39827 = lerp( localfloat4switch1269_g39827 , float4( FINAL_MASK_VERTICAL394_g39827 , 0.0 ) , MASK_VERTICAL602_g39827);
			float4 m_Active1377_g39827 = lerpResult1227_g39827;
			float4 m_ActiveInverted1377_g39827 = lerpResult1227_g39827;
			float4 localfloat4switch1377_g39827 = float4switch1377_g39827( m_switch1377_g39827 , m_Off1377_g39827 , m_Active1377_g39827 , m_ActiveInverted1377_g39827 );
			float4 m_Off1380_g39827 = localfloat4switch1377_g39827;
			float4 ALBEDO_IN1447_g39827 = temp_output_6_0_g39827;
			float4 tex2DNode1396_g39827 = SAMPLE_TEXTURE2D( _Curvaturewear_GrungeMap, sampler_trilinear_repeat, uv_TexCoord1389_g39827 );
			float4 temp_output_12_0_g39834 = ( float4( (_Curvaturewear_Tint).rgb , 0.0 ) * tex2DNode1396_g39827 );
			float3 desaturateInitialColor10_g39834 = temp_output_12_0_g39834.xyz;
			float desaturateDot10_g39834 = dot( desaturateInitialColor10_g39834, float3( 0.299, 0.587, 0.114 ));
			float3 desaturateVar10_g39834 = lerp( desaturateInitialColor10_g39834, desaturateDot10_g39834.xxx, ( 1.0 - ( _Curvaturewear_Saturation + 1.0 ) ) );
			float4 lerpResult1544_g39827 = lerp( ALBEDO_IN1447_g39827 , float4( desaturateVar10_g39834 , 0.0 ) , _Curvaturewear_BlendMix);
			float4 FINAL_MASK_CURVATURE586_g39827 = lerpResult1544_g39827;
			float4 lerpResult860_g39827 = lerp( FINAL_MASK_CURVATURE586_g39827 , localfloat4switch1377_g39827 , MASK_CURVATURE401_g39827);
			float4 m_Active1380_g39827 = lerpResult860_g39827;
			float4 m_ActiveInverted1380_g39827 = lerpResult860_g39827;
			float4 localfloat4switch1380_g39827 = float4switch1380_g39827( m_switch1380_g39827 , m_Off1380_g39827 , m_Active1380_g39827 , m_ActiveInverted1380_g39827 );
			o.Albedo = localfloat4switch1380_g39827.xyz;
			int m_switch1436_g39827 = _Curvaturewear_Mode;
			int m_switch1435_g39827 = _Verticalwear_Mode;
			int m_switch1434_g39827 = _Horizontalwear_Mode;
			float4 MASK_B1377_g37919 = SAMPLE_TEXTURE2D( _MetallicGlossMap, sampler_trilinear_repeat, UV40_g39808 );
			float4 temp_output_977_0_g39827 = ( _MetallicStrength * MASK_B1377_g37919 );
			float m_Off1434_g39827 = temp_output_977_0_g39827.x;
			float FINAL_MASKMETALLIC_HORIZONTAL1026_g39827 = _Horizontalwear_Metallic;
			float4 temp_cast_52 = (FINAL_MASKMETALLIC_HORIZONTAL1026_g39827).xxxx;
			float4 lerpResult1439_g39827 = lerp( temp_output_977_0_g39827 , temp_cast_52 , MASK_HORIZONTAL808_g39827);
			float m_Active1434_g39827 = lerpResult1439_g39827.x;
			float m_ActiveInverted1434_g39827 = lerpResult1439_g39827.x;
			float localfloatswitch1434_g39827 = floatswitch1434_g39827( m_switch1434_g39827 , m_Off1434_g39827 , m_Active1434_g39827 , m_ActiveInverted1434_g39827 );
			float m_Off1435_g39827 = localfloatswitch1434_g39827;
			float FINAL_MASKMETALLIC_VERTICAL1024_g39827 = _Verticalwear_Metallic;
			float lerpResult1438_g39827 = lerp( localfloatswitch1434_g39827 , FINAL_MASKMETALLIC_VERTICAL1024_g39827 , MASK_VERTICAL602_g39827);
			float m_Active1435_g39827 = lerpResult1438_g39827;
			float m_ActiveInverted1435_g39827 = lerpResult1438_g39827;
			float localfloatswitch1435_g39827 = floatswitch1435_g39827( m_switch1435_g39827 , m_Off1435_g39827 , m_Active1435_g39827 , m_ActiveInverted1435_g39827 );
			float m_Off1436_g39827 = localfloatswitch1435_g39827;
			float4 METALLIC_IN1555_g39827 = temp_output_977_0_g39827;
			float4 temp_cast_55 = (_Curvaturewear_Metallic).xxxx;
			float4 lerpResult1553_g39827 = lerp( METALLIC_IN1555_g39827 , temp_cast_55 , _Curvaturewear_BlendMix);
			float4 FINAL_MASKMETALLIC_CURVATURE1022_g39827 = lerpResult1553_g39827;
			float4 temp_cast_56 = (localfloatswitch1435_g39827).xxxx;
			float4 lerpResult1437_g39827 = lerp( FINAL_MASKMETALLIC_CURVATURE1022_g39827 , temp_cast_56 , MASK_CURVATURE401_g39827);
			float m_Active1436_g39827 = lerpResult1437_g39827.x;
			float m_ActiveInverted1436_g39827 = lerpResult1437_g39827.x;
			float localfloatswitch1436_g39827 = floatswitch1436_g39827( m_switch1436_g39827 , m_Off1436_g39827 , m_Active1436_g39827 , m_ActiveInverted1436_g39827 );
			o.Metallic = localfloatswitch1436_g39827;
			int m_switch1433_g39827 = _Curvaturewear_Mode;
			int m_switch1432_g39827 = _Verticalwear_Mode;
			int m_switch1075_g39827 = _Horizontalwear_Mode;
			int m_switch188_g39758 = _SmoothnessModeCutout;
			float3 NORMAL_OUT1491_g37919 = temp_output_1610_30_g37919;
			float3 temp_output_4_0_g39758 = normalize( (WorldNormalVector( i , NORMAL_OUT1491_g37919 )) );
			float3 temp_output_178_0_g39758 = ddx( temp_output_4_0_g39758 );
			float dotResult195_g39758 = dot( temp_output_178_0_g39758 , temp_output_178_0_g39758 );
			float3 temp_output_175_0_g39758 = ddy( temp_output_4_0_g39758 );
			float dotResult201_g39758 = dot( temp_output_175_0_g39758 , temp_output_175_0_g39758 );
			float temp_output_196_0_g39758 = sqrt( saturate( ( ( _SmoothnessStrength * _SmoothnessStrength ) + min( ( ( _SmoothnessVariance * ( dotResult195_g39758 + dotResult201_g39758 ) ) * 2.0 ) , ( _SmoothnessThreshold * _SmoothnessThreshold ) ) ) ) );
			float ALBEDO_R172_g37919 = tex2DNode63_g39808.r;
			float4 temp_cast_59 = (ALBEDO_R172_g37919).xxxx;
			float4 temp_output_9_0_g39758 = temp_cast_59;
			float4 m_Standard188_g39758 = ( min( temp_output_196_0_g39758 , 0.5 ) * ( 1.0 - ( temp_output_9_0_g39758 * float4( 0.79,0,0,0 ) ) ) );
			float4 temp_output_187_0_g39758 = ( 1.0 - temp_output_9_0_g39758 );
			float4 m_Geometric188_g39758 = ( temp_output_196_0_g39758 * temp_output_187_0_g39758 );
			float ALBEDO_A926_g37919 = tex2DNode63_g39808.a;
			float temp_output_1318_0_g37919 = ( 1.0 - _AlphaCutoffBias );
			clip( ALBEDO_A926_g37919 - temp_output_1318_0_g37919);
			float temp_output_1304_0_g37919 = saturate( ( ( ALBEDO_A926_g37919 / max( fwidth( ALBEDO_A926_g37919 ) , 0.0001 ) ) + 0.5 ) );
			float CLIP_OPACITY200_g37919 = temp_output_1304_0_g37919;
			float4 temp_cast_60 = (CLIP_OPACITY200_g37919).xxxx;
			float4 m_GeometricFade188_g39758 = ( temp_output_196_0_g39758 * temp_output_187_0_g39758 * temp_cast_60 );
			int m_switch189_g39758 = _SmoothnessType;
			float4 MASK_G158_g37919 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, UV40_g39808 );
			float4 temp_output_83_0_g39758 = MASK_G158_g37919;
			float4 m_Smoothness189_g39758 = temp_output_83_0_g39758;
			float4 m_Roughness189_g39758 = ( 1.0 - temp_output_83_0_g39758 );
			float4 localfloat4switch189_g39758 = float4switch189_g39758( m_switch189_g39758 , m_Smoothness189_g39758 , m_Roughness189_g39758 );
			float4 m_Texture188_g39758 = ( temp_output_196_0_g39758 * localfloat4switch189_g39758 );
			float4 localfloat4switch188_g39758 = float4switch188_g39758( m_switch188_g39758 , m_Standard188_g39758 , m_Geometric188_g39758 , m_GeometricFade188_g39758 , m_Texture188_g39758 );
			float4 temp_output_1324_33_g37919 = localfloat4switch188_g39758;
			float4 color1225_g37919 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float4 MASK_R1378_g37919 = SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, UV40_g39808 );
			float4 temp_cast_62 = (i.vertexColor.a).xxxx;
			float4 lerpResult28_g37919 = lerp( MASK_R1378_g37919 , temp_cast_62 , (float)_OcclusionSourceMode);
			float4 lerpResult7_g37919 = lerp( color1225_g37919 , lerpResult28_g37919 , _OcclusionStrengthAO);
			float4 temp_output_989_0_g39827 = ( temp_output_1324_33_g37919 * lerpResult7_g37919 );
			float m_Off1075_g39827 = temp_output_989_0_g39827.x;
			float FINAL_MASKSMOOTHNESS_HORIZONTAL1025_g39827 = _Horizontalwear_Smoothness;
			float4 temp_cast_66 = (FINAL_MASKSMOOTHNESS_HORIZONTAL1025_g39827).xxxx;
			float4 lerpResult1030_g39827 = lerp( temp_output_989_0_g39827 , temp_cast_66 , MASK_HORIZONTAL808_g39827);
			float m_Active1075_g39827 = lerpResult1030_g39827.x;
			float m_ActiveInverted1075_g39827 = lerpResult1030_g39827.x;
			float localfloatswitch1075_g39827 = floatswitch1075_g39827( m_switch1075_g39827 , m_Off1075_g39827 , m_Active1075_g39827 , m_ActiveInverted1075_g39827 );
			float m_Off1432_g39827 = localfloatswitch1075_g39827;
			float FINAL_MASKSMOOTHNESS_VERTICAL1023_g39827 = _Verticalwear_Smoothness;
			float lerpResult1028_g39827 = lerp( localfloatswitch1075_g39827 , FINAL_MASKSMOOTHNESS_VERTICAL1023_g39827 , MASK_VERTICAL602_g39827);
			float m_Active1432_g39827 = lerpResult1028_g39827;
			float m_ActiveInverted1432_g39827 = lerpResult1028_g39827;
			float localfloatswitch1432_g39827 = floatswitch1432_g39827( m_switch1432_g39827 , m_Off1432_g39827 , m_Active1432_g39827 , m_ActiveInverted1432_g39827 );
			float m_Off1433_g39827 = localfloatswitch1432_g39827;
			float4 SMOOTHNESS_IN1554_g39827 = temp_output_989_0_g39827;
			float4 temp_cast_69 = (_Curvaturewear_Smoothness).xxxx;
			float4 lerpResult1552_g39827 = lerp( SMOOTHNESS_IN1554_g39827 , temp_cast_69 , _Curvaturewear_BlendMix);
			float4 FINAL_MASKSMOOTHNESS_CURVATURE1021_g39827 = lerpResult1552_g39827;
			float4 temp_cast_70 = (localfloatswitch1432_g39827).xxxx;
			float4 lerpResult1031_g39827 = lerp( FINAL_MASKSMOOTHNESS_CURVATURE1021_g39827 , temp_cast_70 , MASK_CURVATURE401_g39827);
			float m_Active1433_g39827 = lerpResult1031_g39827.x;
			float m_ActiveInverted1433_g39827 = lerpResult1031_g39827.x;
			float localfloatswitch1433_g39827 = floatswitch1433_g39827( m_switch1433_g39827 , m_Off1433_g39827 , m_Active1433_g39827 , m_ActiveInverted1433_g39827 );
			o.Smoothness = localfloatswitch1433_g39827;
			o.Occlusion = saturate( lerpResult7_g37919 ).r;
			o.Alpha = temp_output_1304_0_g37919;
			int m_switch1287_g37919 = _GlancingClipMode;
			float m_Off1287_g37919 = 1.0;
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = Unity_SafeNormalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 normalizeResult1294_g37919 = normalize( cross( ddx( ase_worldPos ) , ddy( ase_worldPos ) ) );
			float dotResult1301_g37919 = dot( ase_worldViewDir , normalizeResult1294_g37919 );
			float temp_output_1321_0_g37919 = ( 1.0 - abs( dotResult1301_g37919 ) );
			float m_Active1287_g37919 = ( 1.0 - ( temp_output_1321_0_g37919 * temp_output_1321_0_g37919 ) );
			float localfloatswitch1287_g37919 = floatswitch1287_g37919( m_switch1287_g37919 , m_Off1287_g37919 , m_Active1287_g37919 );
			clip( localfloatswitch1287_g37919 - _MaskClipValue );
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=18913
486;116;1467;857;5189.893;3862.02;1.3;True;False
Node;AmplifyShaderEditor.CommentaryNode;2820;-3958.95,-3841.381;Inherit;False;395.4027;196.8203;DEBUG SETTINGS ;4;2758;2760;2786;202;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2819;-3960.528,-3968.484;Inherit;False;167.2998;117.9001;GLOBAL SETTINGS ;1;203;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;3052;-3968.79,-3215.634;Inherit;False;329.1997;123.1001;DESF Common ASE Compile Shaders;1;3053;;0,0.2605708,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode;3055;-4768.046,-3639.719;Inherit;False;DESF Core Cutout;4;;37919;e0cdd7758f4404849b063afff4596424;26,1217,0,1311,0,1296,0,1156,0,1141,0,442,0,1509,1,1556,1,1557,1,1552,1,1309,1,1308,1,1333,0,1348,0,1596,0,1368,2,1569,0,96,0,1229,0,1236,0,830,0,1415,0,1399,0,1564,0,1566,0,1565,0;2;1234;FLOAT3;0,0,0;False;1274;FLOAT4;0,0,0,0;False;14;FLOAT4;38;FLOAT3;35;FLOAT3;1586;COLOR;37;FLOAT4;33;COLOR;34;FLOAT;441;FLOAT;46;FLOAT;814;FLOAT;552;FLOAT4;656;FLOAT4;657;FLOAT4;655;FLOAT3;1235
Node;AmplifyShaderEditor.IntNode;203;-3939.473,-3929.117;Inherit;False;Property;_CullMode;Cull Mode;3;2;[Header];[Enum];Create;True;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;202;-3940.271,-3800.278;Inherit;False;Constant;_MaskClipValue;Mask Clip Value;64;1;[HideInInspector];Create;True;1;;0;0;True;0;False;0.5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2786;-3940.189,-3725.2;Inherit;False;Property;_AlphatoCoverage;Alpha to Coverage;2;1;[Enum];Create;True;1;;1;Option1;0;1;Off,0,On,1;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3053;-3953.79,-3172.034;Inherit;False;DESF Common ASE Compile Shaders;-1;;39826;b85b01c42ba8a8a448b731b68fc0dbd9;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;2760;-3752.113,-3796.884;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;1;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;2758;-3749.876,-3722.227;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.FunctionNode;3054;-4326.845,-3635.819;Inherit;False;DESF Module Grunge;119;;39827;b0925d725c9bfd049b8ad9f4b41a5bd0;3,1487,0,1466,0,1473,0;4;6;FLOAT4;0,0,0,0;False;8;FLOAT3;0,0,0;False;977;FLOAT4;0,0,0,0;False;989;FLOAT4;0,0,0,0;False;4;FLOAT4;0;FLOAT3;9;FLOAT;991;FLOAT;990
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;1319;-3962.174,-3634.645;Float;False;True;-1;3;;200;0;Standard;DEC/Grunge/Grunge Cutout Mask Texture;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;True;True;True;Back;0;True;2760;3;False;2757;False;0;False;-1;0;False;-1;False;3;Custom;0;True;True;-10;True;Opaque;;Geometry;All;18;all;True;True;True;True;0;True;2758;False;0;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;200;;-1;-1;-1;-1;1;NatureRendererInstancing=True;False;0;0;True;203;-1;0;True;202;5;Pragma;multi_compile_instancing;False;;Custom;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;8ccd508f733f5f0418220eaf14ecdf81;Custom;Include;Nature Renderer.cginc;False;5d792e02fd6741e4cb63087f97979470;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom;0;0;False;0.1;False;-1;0;True;2786;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;3054;6;3055;38
WireConnection;3054;8;3055;35
WireConnection;3054;977;3055;37
WireConnection;3054;989;3055;33
WireConnection;1319;0;3054;0
WireConnection;1319;1;3054;9
WireConnection;1319;3;3054;991
WireConnection;1319;4;3054;990
WireConnection;1319;5;3055;34
WireConnection;1319;9;3055;46
WireConnection;1319;10;3055;814
ASEEND*/
//CHKSM=ABE2C7005CE4F234FFF3466C781F7E9FA1AF05CA