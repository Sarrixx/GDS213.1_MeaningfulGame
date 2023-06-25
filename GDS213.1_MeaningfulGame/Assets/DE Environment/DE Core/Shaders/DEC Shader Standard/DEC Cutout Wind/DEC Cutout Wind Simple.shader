// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Cutout Wind/Cutout Wind Simple"
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
		[Enum(Off,0,Global,1,Local,2)][Header(WIND)]_WindMode("Wind Mode", Int) = 1
		[Enum(Leaf,0,Palm,1,Grass,2,Simple,3,Ivy,4)]_WindType("Wind Type", Int) = 0
		[Header(WIND MODE GLOBAL)]_GlobalWindInfluenceOther("Wind Strength", Float) = 1
		_GlobalTurbulenceInfluence("Wind Turbulence", Float) = 0.35
		[Header(WIND MODE LOCAL)]_LocalWindStrength("Wind Strength", Float) = 1
		_LocalWindPulse("Wind Pulse", Float) = 0.1
		_LocalWindTurbulence("Wind Turbulence", Float) = 0.35
		_LocalWindDirection("Wind Direction", Float) = 1
		_LocalRandomWindOffset("Wind Random Offset", Float) = 0.2
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
		#include "UnityShaderVariables.cginc"
		#include "UnityStandardUtils.cginc"
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

		#pragma surface surf Standard keepalpha addshadow fullforwardshadows dithercrossfade vertex:vertexDataFunc 
		struct Input
		{
			float3 worldPos;
			float2 uv_texcoord;
			half ASEVFace : VFACE;
			float3 worldNormal;
			INTERNAL_DATA
			float4 vertexColor : COLOR;
		};

		uniform int _CullMode;
		uniform float _AlphatoCoverage;
		uniform int _ColorMask;
		uniform int _ZWriteMode;
		uniform int _Global_Wind_Main_Fade_Enabled;
		uniform int _WindMode;
		uniform int _WindType;
		uniform float _GlobalWindInfluenceOther;
		uniform float _Global_Wind_Main_Intensity;
		uniform float _LocalWindStrength;
		uniform float _Global_Wind_Main_RandomOffset;
		uniform float _LocalRandomWindOffset;
		uniform float _Global_Wind_Main_Pulse;
		uniform float _LocalWindPulse;
		uniform float _Global_Wind_Main_Direction;
		uniform float _LocalWindDirection;
		uniform float _GlobalTurbulenceInfluence;
		uniform float _Global_Wind_Main_Turbulence;
		uniform float _LocalWindTurbulence;
		uniform float _Global_Wind_Main_Fade_Bias;
		uniform int _NormalMode;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_BumpMap);
		uniform float _TilingX;
		uniform float _TilingY;
		uniform float _OffsetX;
		uniform float _OffsetY;
		SamplerState sampler_trilinear_repeat;
		uniform half _NormalStrength;
		uniform float4 _Color;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainTex);
		uniform half _Brightness;
		uniform float _MetallicStrength;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MetallicGlossMap);
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


		float floatswitch2458_g3724( int m_switch, float m_Off, float m_Global, float m_Local )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Global;
			else if(m_switch ==2)
				return m_Local;
			else
			return float(0);
		}


		float floatswitch2468_g3724( int m_switch, float m_Off, float m_Global, float m_Local )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Global;
			else if(m_switch ==2)
				return m_Local;
			else
			return float(0);
		}


		float floatswitch2312_g3724( int m_switch, float m_Off, float m_Global, float m_Local )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Global;
			else if(m_switch ==2)
				return m_Local;
			else
			return float(0);
		}


		float floatswitch2456_g3724( int m_switch, float m_Off, float m_Global, float m_Local )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Global;
			else if(m_switch ==2)
				return m_Local;
			else
			return float(0);
		}


		float2 DirectionalEquation( float _WindDirection )
		{
			float d = _WindDirection * 0.0174532924;
			float xL = cos(d) + 1 / 2;
			float zL = sin(d) + 1 / 2;
			return float2(zL,xL);
		}


		float floatswitch2326_g3724( int m_switch, float m_Off, float m_Global, float m_Local )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Global;
			else if(m_switch ==2)
				return m_Local;
			else
			return float(0);
		}


		float3 float3switch2439_g3724( int m_switch, float3 m_Leaf, float3 m_Palm, float3 m_Grass, float3 m_Simple, float3 m_Ivy )
		{
			if(m_switch ==0)
				return m_Leaf;
			else if(m_switch ==1)
				return m_Palm;
			else if(m_switch ==2)
				return m_Grass;
			else if(m_switch ==3)
				return m_Simple;
			else if(m_switch ==4)
				return m_Ivy;
			else
			return float3(0,0,0);
		}


		float3 float3switch2453_g3724( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Global;
			else if(m_switch ==2)
				return m_Local;
			else
			return float3(0,0,0);
		}


		float3 float3switch3050_g3724( int m_switch, float3 m_Off, float3 m_ActiveFadeOut, float3 m_ActiveFadeIn )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_ActiveFadeOut;
			else if(m_switch ==2)
				return m_ActiveFadeIn;
			else
			return float3(0,0,0);
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


		float floatswitch1287_g37884( int m_switch, float m_Off, float m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float(0);
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			int m_switch3050_g3724 = _Global_Wind_Main_Fade_Enabled;
			int m_switch2453_g3724 = _WindMode;
			float3 m_Off2453_g3724 = float3(0,0,0);
			int m_switch2439_g3724 = _WindType;
			float3 ase_vertex3Pos = v.vertex.xyz;
			float3 VERTEX_POSITION_MATRIX2352_g3724 = mul( unity_ObjectToWorld, float4( ase_vertex3Pos , 0.0 ) ).xyz;
			float3 break2265_g3724 = VERTEX_POSITION_MATRIX2352_g3724;
			int _WIND_MODE2462_g3724 = _WindMode;
			int m_switch2458_g3724 = _WIND_MODE2462_g3724;
			float m_Off2458_g3724 = 1.0;
			float m_Global2458_g3724 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity );
			float m_Local2458_g3724 = _LocalWindStrength;
			float localfloatswitch2458_g3724 = floatswitch2458_g3724( m_switch2458_g3724 , m_Off2458_g3724 , m_Global2458_g3724 , m_Local2458_g3724 );
			float _WIND_STRENGHT2400_g3724 = localfloatswitch2458_g3724;
			int m_switch2468_g3724 = _WIND_MODE2462_g3724;
			float m_Off2468_g3724 = 1.0;
			float m_Global2468_g3724 = _Global_Wind_Main_RandomOffset;
			float m_Local2468_g3724 = _LocalRandomWindOffset;
			float localfloatswitch2468_g3724 = floatswitch2468_g3724( m_switch2468_g3724 , m_Off2468_g3724 , m_Global2468_g3724 , m_Local2468_g3724 );
			float4 transform3073_g3724 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
			float2 appendResult2307_g3724 = (float2(transform3073_g3724.x , transform3073_g3724.z));
			float dotResult2341_g3724 = dot( appendResult2307_g3724 , float2( 12.9898,78.233 ) );
			float lerpResult2238_g3724 = lerp( 0.8 , ( ( localfloatswitch2468_g3724 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3724 ) * 43758.55 ) ));
			float _WIND_RANDOM_OFFSET2244_g3724 = ( _Time.x * lerpResult2238_g3724 );
			float _WIND_TUBULENCE_RANDOM2274_g3724 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g3724 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g3724.z / 15.0 ) ) ) * 0.5 );
			int m_switch2312_g3724 = _WIND_MODE2462_g3724;
			float m_Off2312_g3724 = 1.0;
			float m_Global2312_g3724 = _Global_Wind_Main_Pulse;
			float m_Local2312_g3724 = _LocalWindPulse;
			float localfloatswitch2312_g3724 = floatswitch2312_g3724( m_switch2312_g3724 , m_Off2312_g3724 , m_Global2312_g3724 , m_Local2312_g3724 );
			float _WIND_PULSE2421_g3724 = localfloatswitch2312_g3724;
			float FUNC_Angle2470_g3724 = ( _WIND_STRENGHT2400_g3724 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g3724 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g3724 ) - ( VERTEX_POSITION_MATRIX2352_g3724.z / 50.0 ) ) - ( v.color.r / 20.0 ) ) ) ) * sqrt( v.color.r ) * _WIND_PULSE2421_g3724 );
			float FUNC_Angle_SinA2424_g3724 = sin( FUNC_Angle2470_g3724 );
			float FUNC_Angle_CosA2362_g3724 = cos( FUNC_Angle2470_g3724 );
			int m_switch2456_g3724 = _WIND_MODE2462_g3724;
			float m_Off2456_g3724 = 1.0;
			float m_Global2456_g3724 = _Global_Wind_Main_Direction;
			float m_Local2456_g3724 = _LocalWindDirection;
			float localfloatswitch2456_g3724 = floatswitch2456_g3724( m_switch2456_g3724 , m_Off2456_g3724 , m_Global2456_g3724 , m_Local2456_g3724 );
			float _WindDirection2249_g3724 = localfloatswitch2456_g3724;
			float2 localDirectionalEquation2249_g3724 = DirectionalEquation( _WindDirection2249_g3724 );
			float2 break2469_g3724 = localDirectionalEquation2249_g3724;
			float _WIND_DIRECTION_X2418_g3724 = break2469_g3724.x;
			float lerpResult2258_g3724 = lerp( break2265_g3724.x , ( ( break2265_g3724.y * FUNC_Angle_SinA2424_g3724 ) + ( break2265_g3724.x * FUNC_Angle_CosA2362_g3724 ) ) , _WIND_DIRECTION_X2418_g3724);
			float3 break2340_g3724 = VERTEX_POSITION_MATRIX2352_g3724;
			float3 break2233_g3724 = VERTEX_POSITION_MATRIX2352_g3724;
			float _WIND_DIRECTION_Y2416_g3724 = break2469_g3724.y;
			float lerpResult2275_g3724 = lerp( break2233_g3724.z , ( ( break2233_g3724.y * FUNC_Angle_SinA2424_g3724 ) + ( break2233_g3724.z * FUNC_Angle_CosA2362_g3724 ) ) , _WIND_DIRECTION_Y2416_g3724);
			float3 appendResult2235_g3724 = (float3(lerpResult2258_g3724 , ( ( break2340_g3724.y * FUNC_Angle_CosA2362_g3724 ) - ( break2340_g3724.z * FUNC_Angle_SinA2424_g3724 ) ) , lerpResult2275_g3724));
			float3 VERTEX_POSITION2282_g3724 = ( mul( unity_WorldToObject, float4( appendResult2235_g3724 , 0.0 ) ).xyz - ase_vertex3Pos );
			float3 break2518_g3724 = VERTEX_POSITION2282_g3724;
			half FUNC_SinFunction2336_g3724 = sin( ( ( _WIND_RANDOM_OFFSET2244_g3724 * 200.0 * ( 0.2 + v.color.g ) ) + ( v.color.g * 10.0 ) + _WIND_TUBULENCE_RANDOM2274_g3724 + ( VERTEX_POSITION_MATRIX2352_g3724.z / 2.0 ) ) );
			int m_switch2326_g3724 = _WIND_MODE2462_g3724;
			float m_Off2326_g3724 = 1.0;
			float m_Global2326_g3724 = ( _GlobalTurbulenceInfluence * _Global_Wind_Main_Turbulence );
			float m_Local2326_g3724 = _LocalWindTurbulence;
			float localfloatswitch2326_g3724 = floatswitch2326_g3724( m_switch2326_g3724 , m_Off2326_g3724 , m_Global2326_g3724 , m_Local2326_g3724 );
			float _WIND_TUBULENCE2442_g3724 = localfloatswitch2326_g3724;
			float3 appendResult2480_g3724 = (float3(break2518_g3724.x , ( break2518_g3724.y + ( FUNC_SinFunction2336_g3724 * v.color.b * ( FUNC_Angle2470_g3724 + ( _WIND_STRENGHT2400_g3724 / 200.0 ) ) * _WIND_TUBULENCE2442_g3724 ) ) , break2518_g3724.z));
			float3 VERTEX_LEAF2396_g3724 = appendResult2480_g3724;
			float3 m_Leaf2439_g3724 = VERTEX_LEAF2396_g3724;
			float3 VERTEX_PALM2310_g3724 = ( ( FUNC_SinFunction2336_g3724 * v.color.b * ( FUNC_Angle2470_g3724 + ( _WIND_STRENGHT2400_g3724 / 200.0 ) ) * _WIND_TUBULENCE2442_g3724 ) + VERTEX_POSITION2282_g3724 );
			float3 m_Palm2439_g3724 = VERTEX_PALM2310_g3724;
			float3 break2486_g3724 = VERTEX_POSITION2282_g3724;
			float temp_output_2514_0_g3724 = ( FUNC_SinFunction2336_g3724 * v.color.b * ( FUNC_Angle2470_g3724 + ( _WIND_STRENGHT2400_g3724 / 200.0 ) ) );
			float lerpResult2482_g3724 = lerp( 0.0 , temp_output_2514_0_g3724 , _WIND_DIRECTION_X2418_g3724);
			float lerpResult2484_g3724 = lerp( 0.0 , temp_output_2514_0_g3724 , _WIND_DIRECTION_Y2416_g3724);
			float3 appendResult2489_g3724 = (float3(( break2486_g3724.x + lerpResult2482_g3724 ) , break2486_g3724.y , ( break2486_g3724.z + lerpResult2484_g3724 )));
			float3 VERTEX_GRASS2242_g3724 = appendResult2489_g3724;
			float3 m_Grass2439_g3724 = VERTEX_GRASS2242_g3724;
			float3 m_Simple2439_g3724 = VERTEX_POSITION2282_g3724;
			float clampResult2884_g3724 = clamp( ( _WIND_STRENGHT2400_g3724 - 0.95 ) , 0.0 , 1.0 );
			float3 break2708_g3724 = VERTEX_POSITION2282_g3724;
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float3 break2718_g3724 = ase_worldPos;
			float temp_output_2690_0_g3724 = ( _WIND_RANDOM_OFFSET2244_g3724 * 25.0 );
			float clampResult2691_g3724 = clamp( 25.0 , 0.2 , 0.25 );
			float2 appendResult2694_g3724 = (float2(temp_output_2690_0_g3724 , ( temp_output_2690_0_g3724 / clampResult2691_g3724 )));
			float3 appendResult2706_g3724 = (float3(break2708_g3724.x , ( break2708_g3724.y + cos( ( ( ( break2718_g3724.x + break2718_g3724.y + break2718_g3724.z ) * 2.0 ) + appendResult2694_g3724 + FUNC_Angle2470_g3724 + _WIND_TUBULENCE2442_g3724 ) ) ).x , break2708_g3724.z));
			float3 temp_output_2613_0_g3724 = ( clampResult2884_g3724 * appendResult2706_g3724 );
			float3 ase_vertexNormal = v.normal.xyz;
			float4 ase_vertexTangent = v.tangent;
			float3 VERTEX_IVY997_g3724 = ( ( ( cos( temp_output_2613_0_g3724 ) + ( -0.3193 * UNITY_PI ) ) * ase_vertexNormal * 0.2 * ( FUNC_SinFunction2336_g3724 * v.color.b ) ) + ( sin( temp_output_2613_0_g3724 ) * cross( ase_vertexNormal , ase_vertexTangent.xyz ) * 0.2 ) );
			float3 m_Ivy2439_g3724 = VERTEX_IVY997_g3724;
			float3 localfloat3switch2439_g3724 = float3switch2439_g3724( m_switch2439_g3724 , m_Leaf2439_g3724 , m_Palm2439_g3724 , m_Grass2439_g3724 , m_Simple2439_g3724 , m_Ivy2439_g3724 );
			float3 m_Global2453_g3724 = localfloat3switch2439_g3724;
			float3 m_Local2453_g3724 = localfloat3switch2439_g3724;
			float3 localfloat3switch2453_g3724 = float3switch2453_g3724( m_switch2453_g3724 , m_Off2453_g3724 , m_Global2453_g3724 , m_Local2453_g3724 );
			float3 m_Off3050_g3724 = localfloat3switch2453_g3724;
			float temp_output_3048_0_g3724 = saturate( pow( ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _Global_Wind_Main_Fade_Bias ) , 5.0 ) );
			float3 m_ActiveFadeOut3050_g3724 = ( localfloat3switch2453_g3724 * ( 1.0 - temp_output_3048_0_g3724 ) );
			float3 m_ActiveFadeIn3050_g3724 = ( localfloat3switch2453_g3724 * temp_output_3048_0_g3724 );
			float3 localfloat3switch3050_g3724 = float3switch3050_g3724( m_switch3050_g3724 , m_Off3050_g3724 , m_ActiveFadeOut3050_g3724 , m_ActiveFadeIn3050_g3724 );
			float3 temp_output_1234_0_g37884 = localfloat3switch3050_g3724;
			v.vertex.xyz += temp_output_1234_0_g37884;
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			int m_switch37_g39824 = _NormalMode;
			float2 appendResult168_g37884 = (float2(_TilingX , _TilingY));
			float2 appendResult167_g37884 = (float2(_OffsetX , _OffsetY));
			float2 uv_TexCoord2_g39802 = i.uv_texcoord * appendResult168_g37884 + appendResult167_g37884;
			float2 appendResult6_g39802 = (float2(uv_TexCoord2_g39802.x , uv_TexCoord2_g39802.y));
			float2 OUT_UV213_g37884 = appendResult6_g39802;
			float2 UV40_g39808 = OUT_UV213_g37884;
			float4 NORMAL_RGB1382_g37884 = SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, UV40_g39808 );
			float4 temp_output_1_0_g39806 = NORMAL_RGB1382_g37884;
			float temp_output_8_0_g39806 = _NormalStrength;
			float3 temp_output_1519_59_g37884 = UnpackScaleNormal( temp_output_1_0_g39806, temp_output_8_0_g39806 );
			float3 NORMAL_IN42_g39824 = temp_output_1519_59_g37884;
			float3 m_Default37_g39824 = NORMAL_IN42_g39824;
			float3 m_Flip37_g39824 = ( NORMAL_IN42_g39824 * i.ASEVFace );
			float3 break33_g39824 = NORMAL_IN42_g39824;
			float3 appendResult41_g39824 = (float3(break33_g39824.x , break33_g39824.y , ( break33_g39824.z * i.ASEVFace )));
			float3 m_Mirror37_g39824 = appendResult41_g39824;
			float3 localfloat3switch37_g39824 = float3switch37_g39824( m_switch37_g39824 , m_Default37_g39824 , m_Flip37_g39824 , m_Mirror37_g39824 );
			float3 temp_output_1610_30_g37884 = localfloat3switch37_g39824;
			o.Normal = temp_output_1610_30_g37884;
			float4 tex2DNode63_g39808 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g39808 );
			float4 ALBEDO_RGBA1381_g37884 = tex2DNode63_g39808;
			float3 temp_output_3_0_g37884 = ( (_Color).rgb * (ALBEDO_RGBA1381_g37884).rgb * _Brightness );
			o.Albedo = ( float4( temp_output_3_0_g37884 , 0.0 ) + float4(0,0,0,0) ).xyz;
			float4 MASK_B1377_g37884 = SAMPLE_TEXTURE2D( _MetallicGlossMap, sampler_trilinear_repeat, UV40_g39808 );
			o.Metallic = ( _MetallicStrength * MASK_B1377_g37884 ).r;
			int m_switch188_g39758 = _SmoothnessModeCutout;
			float3 NORMAL_OUT1491_g37884 = temp_output_1610_30_g37884;
			float3 temp_output_4_0_g39758 = normalize( (WorldNormalVector( i , NORMAL_OUT1491_g37884 )) );
			float3 temp_output_178_0_g39758 = ddx( temp_output_4_0_g39758 );
			float dotResult195_g39758 = dot( temp_output_178_0_g39758 , temp_output_178_0_g39758 );
			float3 temp_output_175_0_g39758 = ddy( temp_output_4_0_g39758 );
			float dotResult201_g39758 = dot( temp_output_175_0_g39758 , temp_output_175_0_g39758 );
			float temp_output_196_0_g39758 = sqrt( saturate( ( ( _SmoothnessStrength * _SmoothnessStrength ) + min( ( ( _SmoothnessVariance * ( dotResult195_g39758 + dotResult201_g39758 ) ) * 2.0 ) , ( _SmoothnessThreshold * _SmoothnessThreshold ) ) ) ) );
			float ALBEDO_R172_g37884 = tex2DNode63_g39808.r;
			float4 temp_cast_4 = (ALBEDO_R172_g37884).xxxx;
			float4 temp_output_9_0_g39758 = temp_cast_4;
			float4 m_Standard188_g39758 = ( min( temp_output_196_0_g39758 , 0.5 ) * ( 1.0 - ( temp_output_9_0_g39758 * float4( 0.79,0,0,0 ) ) ) );
			float4 temp_output_187_0_g39758 = ( 1.0 - temp_output_9_0_g39758 );
			float4 m_Geometric188_g39758 = ( temp_output_196_0_g39758 * temp_output_187_0_g39758 );
			float ALBEDO_A926_g37884 = tex2DNode63_g39808.a;
			float temp_output_1318_0_g37884 = ( 1.0 - _AlphaCutoffBias );
			clip( ALBEDO_A926_g37884 - temp_output_1318_0_g37884);
			float temp_output_1304_0_g37884 = saturate( ( ( ALBEDO_A926_g37884 / max( fwidth( ALBEDO_A926_g37884 ) , 0.0001 ) ) + 0.5 ) );
			float CLIP_OPACITY200_g37884 = temp_output_1304_0_g37884;
			float4 temp_cast_5 = (CLIP_OPACITY200_g37884).xxxx;
			float4 m_GeometricFade188_g39758 = ( temp_output_196_0_g39758 * temp_output_187_0_g39758 * temp_cast_5 );
			int m_switch189_g39758 = _SmoothnessType;
			float4 MASK_G158_g37884 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, UV40_g39808 );
			float4 temp_output_83_0_g39758 = MASK_G158_g37884;
			float4 m_Smoothness189_g39758 = temp_output_83_0_g39758;
			float4 m_Roughness189_g39758 = ( 1.0 - temp_output_83_0_g39758 );
			float4 localfloat4switch189_g39758 = float4switch189_g39758( m_switch189_g39758 , m_Smoothness189_g39758 , m_Roughness189_g39758 );
			float4 m_Texture188_g39758 = ( temp_output_196_0_g39758 * localfloat4switch189_g39758 );
			float4 localfloat4switch188_g39758 = float4switch188_g39758( m_switch188_g39758 , m_Standard188_g39758 , m_Geometric188_g39758 , m_GeometricFade188_g39758 , m_Texture188_g39758 );
			float4 temp_output_1324_33_g37884 = localfloat4switch188_g39758;
			float4 color1225_g37884 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float4 MASK_R1378_g37884 = SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, UV40_g39808 );
			float4 temp_cast_7 = (i.vertexColor.a).xxxx;
			float4 lerpResult28_g37884 = lerp( MASK_R1378_g37884 , temp_cast_7 , (float)_OcclusionSourceMode);
			float4 lerpResult7_g37884 = lerp( color1225_g37884 , lerpResult28_g37884 , _OcclusionStrengthAO);
			o.Smoothness = ( temp_output_1324_33_g37884 * lerpResult7_g37884 ).x;
			o.Occlusion = saturate( lerpResult7_g37884 ).r;
			o.Alpha = temp_output_1304_0_g37884;
			int m_switch1287_g37884 = _GlancingClipMode;
			float m_Off1287_g37884 = 1.0;
			float3 ase_worldPos = i.worldPos;
			float3 ase_worldViewDir = Unity_SafeNormalize( UnityWorldSpaceViewDir( ase_worldPos ) );
			float3 normalizeResult1294_g37884 = normalize( cross( ddx( ase_worldPos ) , ddy( ase_worldPos ) ) );
			float dotResult1301_g37884 = dot( ase_worldViewDir , normalizeResult1294_g37884 );
			float temp_output_1321_0_g37884 = ( 1.0 - abs( dotResult1301_g37884 ) );
			float m_Active1287_g37884 = ( 1.0 - ( temp_output_1321_0_g37884 * temp_output_1321_0_g37884 ) );
			float localfloatswitch1287_g37884 = floatswitch1287_g37884( m_switch1287_g37884 , m_Off1287_g37884 , m_Active1287_g37884 );
			clip( localfloatswitch1287_g37884 - _MaskClipValue );
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=18913
486;116;1467;857;4874.284;4083.075;1;True;False
Node;AmplifyShaderEditor.CommentaryNode;2820;-3940.75,-3842.681;Inherit;False;394.5028;194.4201;DEBUG SETTINGS ;4;2758;2760;2786;202;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;2819;-3937.128,-3963.284;Inherit;False;170;115;GLOBAL SETTINGS ;1;203;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;3052;-3938.89,-3214.334;Inherit;False;349.5999;125.9001;DESF Common ASE Compile Shaders;1;3053;;0,0.2605708,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode;3054;-4664.943,-3635.82;Inherit;False;DESF Module Wind;119;;3724;b135a554f7e4d0b41bba02c61b34ae74;11,938,0,2881,0,2454,1,2457,1,2432,1,2434,1,2433,1,2371,1,2752,0,2995,0,2878,0;0;2;FLOAT3;2190;FLOAT4;2970
Node;AmplifyShaderEditor.IntNode;203;-3916.073,-3923.917;Inherit;False;Property;_CullMode;Cull Mode;3;2;[Header];[Enum];Create;True;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;0;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;202;-3922.071,-3801.578;Inherit;False;Constant;_MaskClipValue;Mask Clip Value;64;1;[HideInInspector];Create;True;1;;0;0;True;0;False;0.5;1;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.RangedFloatNode;2786;-3921.989,-3726.5;Inherit;False;Property;_AlphatoCoverage;Alpha to Coverage;2;1;[Enum];Create;True;1;;1;Option1;0;1;Off,0,On,1;True;0;False;0;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;3055;-4405.784,-3635.52;Inherit;False;DESF Core Cutout;4;;37884;e0cdd7758f4404849b063afff4596424;26,1217,0,1311,0,1296,0,1156,0,1141,0,442,0,1509,1,1556,1,1557,1,1552,1,1309,1,1308,1,1333,0,1348,0,1596,0,1368,0,1569,0,96,0,1229,0,1236,0,830,0,1415,0,1399,0,1564,0,1566,0,1565,0;2;1234;FLOAT3;0,0,0;False;1274;FLOAT4;0,0,0,0;False;14;FLOAT4;38;FLOAT3;35;FLOAT3;1586;COLOR;37;FLOAT4;33;COLOR;34;FLOAT;441;FLOAT;46;FLOAT;814;FLOAT;552;FLOAT4;656;FLOAT4;657;FLOAT4;655;FLOAT3;1235
Node;AmplifyShaderEditor.FunctionNode;3053;-3921.89,-3169.935;Inherit;False;DESF Common ASE Compile Shaders;-1;;39826;b85b01c42ba8a8a448b731b68fc0dbd9;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;2758;-3729.376,-3727.127;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.IntNode;2760;-3728.312,-3800.184;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;1;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;1319;-3941.374,-3630.745;Float;False;True;-1;3;;200;0;Standard;DEC/Cutout Wind/Cutout Wind Simple;False;False;False;False;False;False;False;False;False;False;False;False;True;False;False;False;False;False;True;True;True;Back;0;True;2760;3;False;2757;False;0;False;-1;0;False;-1;False;3;Custom;0;True;True;-10;True;Opaque;;Geometry;All;18;all;True;True;True;True;0;True;2758;False;0;False;-1;255;False;-1;255;False;-1;7;False;-1;1;False;-1;1;False;-1;1;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;0;False;-1;0;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;200;;-1;-1;-1;-1;1;NatureRendererInstancing=True;False;0;0;True;203;-1;0;True;202;5;Pragma;multi_compile_instancing;False;;Custom;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;8ccd508f733f5f0418220eaf14ecdf81;Custom;Include;Nature Renderer.cginc;False;5d792e02fd6741e4cb63087f97979470;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom;0;0;False;0.1;False;-1;0;True;2786;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;3055;1234;3054;2190
WireConnection;3055;1274;3054;2970
WireConnection;1319;0;3055;38
WireConnection;1319;1;3055;35
WireConnection;1319;3;3055;37
WireConnection;1319;4;3055;33
WireConnection;1319;5;3055;34
WireConnection;1319;9;3055;46
WireConnection;1319;10;3055;814
WireConnection;1319;11;3055;1235
ASEEND*/
//CHKSM=C7586ADF8F511368A6E1005EF39E8E180B4FF04A