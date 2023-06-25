// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Rain/Rain Surface Wind Detail"
{
	Properties
	{
		[Header(DEBUG SETTINGS)][Enum(Off,0,On,1)]_ZWriteMode("ZWrite Mode", Int) = 1
		[Enum(None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15)]_ColorMask("Color Mask Mode", Int) = 15
		[Header(GLOBAL SETTINGS)][Enum(UnityEngine.Rendering.CullMode)]_CullMode("Cull Mode", Int) = 0
		[Header(MAP MAIN TEXTURE)]_Color("Albedo Tint", Color) = (1,1,1,0)
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
		[Header(DETAIL)][Enum(Off,0,Active,1)]_EnableDetailMap("Enable Detail Map", Int) = 0
		_ColorDetail("Tint", Color) = (1,1,1,0)
		[SingleLineTexture]_DetailAlbedoMap("Albedo Map", 2D) = "white" {}
		_DetailTilingXDetail("Tiling X", Float) = 1
		_DetailTilingYDetail("Tiling Y", Float) = 1
		_DetailOffsetXDetail("Offset X", Float) = 0
		_DetailOffsetYDetail("Offset Y", Float) = 0
		[Normal][SingleLineTexture]_DetailNormalMap("Normal Map", 2D) = "bump" {}
		_DetailNormalMapScale("Normal Strength", Float) = 1
		_DetailBlendInfluence("Blend Influence", Range( 0 , 3)) = 0
		[Enum(Red,0,Green,1,Blue,2)]_BlendColor("Blend Vertex Color", Int) = 0
		_BlendHeight("Blend Height", Range( 0 , 1.25)) = 1
		_DetailBlendSmooth("Blend Smooth", Range( 0.01 , 0.5)) = 0.35
		[Header(DETAIL MASK)][Enum(Off,0,Active,1,Active Inverted,2)]_EnableDetailMask("Enable Detail Mask", Int) = 0
		[SingleLineTexture]_DetailMaskMap("Mask Map", 2D) = "white" {}
		_Detail_BlendAmountMask("Blend Amount", Range( 0.001 , 1)) = 0.5
		_Detail_BlendHardnessMask("Blend Hardness", Range( 0.001 , 5)) = 1
		_Detail_BlendFalloffMask("Blend Falloff", Range( 0.001 , 0.999)) = 0.5
		_DetailTilingXDetailMask("Tiling X", Float) = 1
		_DetailTilingYDetailMask("Tiling Y", Float) = 1
		_DetailOffsetXDetailMask("Offset X", Float) = 0
		_DetailOffsetYDetailMask("Offset Y", Float) = 0
		[Header(RAIN)]_Rain_WetnessDarken("Rain Wetness Darken", Range( 0 , 1)) = 0.025
		[Enum(Off,0,Active,1)]_Rain_GlobalWetnessMode("Rain Global Wetness", Int) = 1
		[Enum(Off,0,Active,1)][Header (RAIN HORIZONTAL)]_Horizontal_RainMode("Rain Mode", Int) = 0
		[Normal][SingleLineTexture]_Horizontal_RainMap("Rain Map Horizontal", 2D) = "bump" {}
		_Horizontal_Intensity("Intensity", Range( 0 , 10)) = 9
		_Horizontal_Speed("Speed", Range( 0 , 50)) = 15
		_Horizontal_ScreenContribution("Screen Contribution", Range( 0 , 1)) = 0.001
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
		_Horizontal_Columns("Columns", Float) = 8
		_Horizontal_Rows("Rows", Float) = 8
		[Enum(Standard,0,Stochastic,1)]_Horizontal_ModeUV("Mode UV", Int) = 0
		_Horizontal_TilingX("Tiling X", Float) = 5
		_Horizontal_TilingY("Tiling Y", Float) = 5
		_Horizontal_OffsetX("Offset X", Float) = 0
		_Horizontal_OffsetY("Offset Y", Float) = 0
		[Enum(Off,0,Active,1)][Header (RAIN VERTICAL)]_Vertical_RainMode("Rain Mode", Int) = 0
		[Normal][SingleLineTexture]_Vertical_RainMap("Rain Map Vertical", 2D) = "bump" {}
		_Vertical_Intensity("Intensity", Range( 0 , 10)) = 6
		_Vertical_SmoothEdge("Smooth Edge", Range( -0.1 , 0.1)) = 0
		_Vertical_Speed("Speed", Range( 0 , 50)) = 22
		_Vertical_ScreenContribution("Screen Contribution", Range( 0 , 1)) = 0.001
		_Vertical_Columns("Columns", Float) = 5
		_Vertical_Rows("Rows", Float) = 5
		[Enum(Standard,0,Stochastic,1)]_Vertical_ModeUV("Mode UV", Int) = 1
		_Vertical_TilingX("Tiling X", Float) = 9
		_Vertical_TilingY("Tiling Y", Float) = 9
		[Enum(Off,0,Active,1)][Header (RAIN STATIC)]_Static_RainMode("Rain Mode", Int) = 0
		[Normal][SingleLineTexture]_Static_RainMap("Rain Map Static", 2D) = "bump" {}
		_Static_Intensity("Intensity", Range( 0 , 10)) = 9
		_Static_ScreenContribution("Screen Contribution", Range( 0 , 1)) = 0.001
		[Enum(Standard,0,Stochastic,1)]_Static_ModeUV("Mode UV", Int) = 0
		_Static_TilingX("Tiling X", Float) = 1
		_Static_TilingY("Tiling Y", Float) = 1
		_Static_OffsetX("Offset X", Float) = 0
		_Static_OffsetY("Offset Y", Float) = 0
		[Enum(Off,0,Global,1,Local,2)][Header(WIND)]_WindMode("Wind Mode", Int) = 1
		[Header(WIND MODE GLOBAL)]_GlobalWindInfluenceOther("Wind Strength", Float) = 1
		[Header(WIND MODE LOCAL)]_LocalWindStrength("Wind Strength", Float) = 1
		_LocalWindPulse("Wind Pulse", Float) = 0.1
		_LocalWindDirection("Wind Direction", Float) = 1
		_LocalRandomWindOffset("Wind Random Offset", Float) = 0.2
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
			float4 vertexColor : COLOR;
			float4 screenPos;
			float3 worldNormal;
			INTERNAL_DATA
		};

		uniform int _ColorMask;
		uniform int _CullMode;
		uniform int _ZWriteMode;
		uniform float _Vertical_Intensity;
		uniform float _Horizontal_Intensity;
		uniform int _Global_Wind_Main_Fade_Enabled;
		uniform int _WindMode;
		uniform float _GlobalWindInfluenceOther;
		uniform float _Global_Wind_Main_Intensity;
		uniform float _LocalWindStrength;
		uniform float _Global_Wind_Main_RandomOffset;
		uniform float _LocalRandomWindOffset;
		uniform float _Global_Wind_Main_Pulse;
		uniform float _LocalWindPulse;
		uniform float _Global_Wind_Main_Direction;
		uniform float _LocalWindDirection;
		uniform float _Global_Wind_Main_Fade_Bias;
		uniform int _Vertical_RainMode;
		uniform int _EnableDetailMap;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_BumpMap);
		uniform float _TilingX;
		uniform float _TilingY;
		uniform float _OffsetX;
		uniform float _OffsetY;
		SamplerState sampler_trilinear_repeat;
		uniform half _NormalStrength;
		uniform int _EnableDetailMask;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_DetailNormalMap);
		uniform float _DetailTilingXDetail;
		uniform float _DetailTilingYDetail;
		uniform half _DetailOffsetXDetail;
		uniform half _DetailOffsetYDetail;
		uniform half _DetailNormalMapScale;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_DetailMaskMap);
		uniform float _DetailTilingXDetailMask;
		uniform float _DetailTilingYDetailMask;
		uniform half _DetailOffsetXDetailMask;
		uniform half _DetailOffsetYDetailMask;
		uniform half _Detail_BlendAmountMask;
		uniform half _Detail_BlendHardnessMask;
		uniform half _Detail_BlendFalloffMask;
		uniform float4 _Color;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MainTex);
		uniform half _Brightness;
		uniform half _DetailBlendInfluence;
		uniform int _BlendColor;
		uniform half _BlendHeight;
		uniform half _DetailBlendSmooth;
		uniform int _Vertical_ModeUV;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Vertical_RainMap);
		uniform float _Vertical_TilingX;
		uniform float _Vertical_TilingY;
		uniform float _Vertical_ScreenContribution;
		uniform float _Vertical_Columns;
		uniform float _Vertical_Rows;
		uniform float _Vertical_Speed;
		uniform int _Global_Rain_Enabled;
		uniform half _Global_Rain_Intensity;
		uniform float _Vertical_SmoothEdge;
		uniform int _SmoothnessModeSurface;
		uniform int _SmoothnessType;
		uniform float _SmoothnessStrength;
		uniform float _SmoothnessVariance;
		uniform float _SmoothnessThreshold;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_SmoothnessMap);
		UNITY_DECLARE_TEX2D_NOSAMPLER(_OcclusionMap);
		uniform int _OcclusionSourceMode;
		uniform float _OcclusionStrengthAO;
		uniform int _Static_RainMode;
		uniform int _Static_ModeUV;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Static_RainMap);
		uniform float _Static_TilingX;
		uniform float _Static_TilingY;
		uniform float _Static_OffsetX;
		uniform float _Static_OffsetY;
		uniform float _Static_ScreenContribution;
		uniform float _Static_Intensity;
		uniform int _Horizontal_RainMode;
		uniform int _Horizontal_ModeUV;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Horizontal_RainMap);
		uniform float _Horizontal_TilingX;
		uniform float _Horizontal_TilingY;
		uniform float _Horizontal_OffsetX;
		uniform float _Horizontal_OffsetY;
		uniform float _Horizontal_ScreenContribution;
		uniform float _Horizontal_Columns;
		uniform float _Horizontal_Rows;
		uniform float _Horizontal_Speed;
		uniform half4 _ColorDetail;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_DetailAlbedoMap);
		uniform float _Rain_WetnessDarken;
		uniform float _MetallicStrength;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MetallicGlossMap);
		uniform int _Rain_GlobalWetnessMode;
		uniform int _Global_Wetness_Enabled;
		uniform half _Global_Wetness_Intensity;


		float floatswitch2458_g3450( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2468_g3450( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2312_g3450( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float floatswitch2456_g3450( int m_switch, float m_Off, float m_Global, float m_Local )
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


		float3 float3switch2453_g3450( int m_switch, float3 m_Off, float3 m_Global, float3 m_Local )
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


		float3 float3switch3050_g3450( int m_switch, float3 m_Off, float3 m_ActiveFadeOut, float3 m_ActiveFadeIn )
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


		float3 float3switch221_g39591( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveInverted )
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


		float floatswitch319_g39591( int m_switch, float m_Red, float m_Green, float m_Blue )
		{
			if(m_switch ==0)
				return m_Red;
			else if(m_switch ==1)
				return m_Green;
			else if(m_switch ==2)
				return m_Blue;
			else
			return float(0);
		}


		float3 float3switch127_g39591( int m_switch, float3 m_Off, float3 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float3(0,0,0);
		}


		float floatswitch1190_g39599( int m_switch, float m_Off, float m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float(0);
		}


		void StochasticTiling( float2 UV, out float2 UV1, out float2 UV2, out float2 UV3, out float W1, out float W2, out float W3 )
		{
			float2 vertex1, vertex2, vertex3;
			// Scaling of the input
			float2 uv = UV * 3.464; // 2 * sqrt (3)
			// Skew input space into simplex triangle grid
			const float2x2 gridToSkewedGrid = float2x2( 1.0, 0.0, -0.57735027, 1.15470054 );
			float2 skewedCoord = mul( gridToSkewedGrid, uv );
			// Compute local triangle vertex IDs and local barycentric coordinates
			int2 baseId = int2( floor( skewedCoord ) );
			float3 temp = float3( frac( skewedCoord ), 0 );
			temp.z = 1.0 - temp.x - temp.y;
			if ( temp.z > 0.0 )
			{
				W1 = temp.z;
				W2 = temp.y;
				W3 = temp.x;
				vertex1 = baseId;
				vertex2 = baseId + int2( 0, 1 );
				vertex3 = baseId + int2( 1, 0 );
			}
			else
			{
				W1 = -temp.z;
				W2 = 1.0 - temp.y;
				W3 = 1.0 - temp.x;
				vertex1 = baseId + int2( 1, 1 );
				vertex2 = baseId + int2( 1, 0 );
				vertex3 = baseId + int2( 0, 1 );
			}
			UV1 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex1 ) ) * 43758.5453 );
			UV2 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex2 ) ) * 43758.5453 );
			UV3 = UV + frac( sin( mul( float2x2( 127.1, 311.7, 269.5, 183.3 ), vertex3 ) ) * 43758.5453 );
			return;
		}


		float3 float3switch914_g39599( int m_switch, float3 m_Standard, float3 m_Stochastic )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Stochastic;
			else
			return float3(0,0,0);
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


		float3 float3switch( int m_switch, float3 m_Off, float3 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float3(0,0,0);
		}


		float floatswitch1186_g39599( int m_switch, float m_Off, float m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float(0);
		}


		float3 float3switch992_g39599( int m_switch, float3 m_Standard, float3 m_Stochastic )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Stochastic;
			else
			return float3(0,0,0);
		}


		float floatswitch1179_g39599( int m_switch, float m_Off, float m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float(0);
		}


		float3 float3switch1505_g39599( int m_switch, float3 m_Standard, float3 m_Stochastic )
		{
			if(m_switch ==0)
				return m_Standard;
			else if(m_switch ==1)
				return m_Stochastic;
			else
			return float3(0,0,0);
		}


		float4 float4switch226_g39591( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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


		float4 float4switch125_g39591( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch12_g39604( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch23_g39604( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
		}


		void vertexDataFunc( inout appdata_full v, out Input o )
		{
			UNITY_INITIALIZE_OUTPUT( Input, o );
			int m_switch3050_g3450 = _Global_Wind_Main_Fade_Enabled;
			int m_switch2453_g3450 = _WindMode;
			float3 m_Off2453_g3450 = float3(0,0,0);
			float3 ase_vertex3Pos = v.vertex.xyz;
			float3 VERTEX_POSITION_MATRIX2352_g3450 = mul( unity_ObjectToWorld, float4( ase_vertex3Pos , 0.0 ) ).xyz;
			float3 break2265_g3450 = VERTEX_POSITION_MATRIX2352_g3450;
			int _WIND_MODE2462_g3450 = _WindMode;
			int m_switch2458_g3450 = _WIND_MODE2462_g3450;
			float m_Off2458_g3450 = 1.0;
			float m_Global2458_g3450 = ( _GlobalWindInfluenceOther * _Global_Wind_Main_Intensity );
			float m_Local2458_g3450 = _LocalWindStrength;
			float localfloatswitch2458_g3450 = floatswitch2458_g3450( m_switch2458_g3450 , m_Off2458_g3450 , m_Global2458_g3450 , m_Local2458_g3450 );
			float _WIND_STRENGHT2400_g3450 = localfloatswitch2458_g3450;
			int m_switch2468_g3450 = _WIND_MODE2462_g3450;
			float m_Off2468_g3450 = 1.0;
			float m_Global2468_g3450 = _Global_Wind_Main_RandomOffset;
			float m_Local2468_g3450 = _LocalRandomWindOffset;
			float localfloatswitch2468_g3450 = floatswitch2468_g3450( m_switch2468_g3450 , m_Off2468_g3450 , m_Global2468_g3450 , m_Local2468_g3450 );
			float4 transform3073_g3450 = mul(unity_ObjectToWorld,float4( 0,0,0,1 ));
			float2 appendResult2307_g3450 = (float2(transform3073_g3450.x , transform3073_g3450.z));
			float dotResult2341_g3450 = dot( appendResult2307_g3450 , float2( 12.9898,78.233 ) );
			float lerpResult2238_g3450 = lerp( 0.8 , ( ( localfloatswitch2468_g3450 / 2.0 ) + 0.9 ) , frac( ( sin( dotResult2341_g3450 ) * 43758.55 ) ));
			float _WIND_RANDOM_OFFSET2244_g3450 = ( _Time.x * lerpResult2238_g3450 );
			float _WIND_TUBULENCE_RANDOM2274_g3450 = ( sin( ( ( _WIND_RANDOM_OFFSET2244_g3450 * 40.0 ) - ( VERTEX_POSITION_MATRIX2352_g3450.z / 15.0 ) ) ) * 0.5 );
			int m_switch2312_g3450 = _WIND_MODE2462_g3450;
			float m_Off2312_g3450 = 1.0;
			float m_Global2312_g3450 = _Global_Wind_Main_Pulse;
			float m_Local2312_g3450 = _LocalWindPulse;
			float localfloatswitch2312_g3450 = floatswitch2312_g3450( m_switch2312_g3450 , m_Off2312_g3450 , m_Global2312_g3450 , m_Local2312_g3450 );
			float _WIND_PULSE2421_g3450 = localfloatswitch2312_g3450;
			float FUNC_Angle2470_g3450 = ( _WIND_STRENGHT2400_g3450 * ( 1.0 + sin( ( ( ( ( _WIND_RANDOM_OFFSET2244_g3450 * 2.0 ) + _WIND_TUBULENCE_RANDOM2274_g3450 ) - ( VERTEX_POSITION_MATRIX2352_g3450.z / 50.0 ) ) - ( v.color.r / 20.0 ) ) ) ) * sqrt( v.color.r ) * _WIND_PULSE2421_g3450 );
			float FUNC_Angle_SinA2424_g3450 = sin( FUNC_Angle2470_g3450 );
			float FUNC_Angle_CosA2362_g3450 = cos( FUNC_Angle2470_g3450 );
			int m_switch2456_g3450 = _WIND_MODE2462_g3450;
			float m_Off2456_g3450 = 1.0;
			float m_Global2456_g3450 = _Global_Wind_Main_Direction;
			float m_Local2456_g3450 = _LocalWindDirection;
			float localfloatswitch2456_g3450 = floatswitch2456_g3450( m_switch2456_g3450 , m_Off2456_g3450 , m_Global2456_g3450 , m_Local2456_g3450 );
			float _WindDirection2249_g3450 = localfloatswitch2456_g3450;
			float2 localDirectionalEquation2249_g3450 = DirectionalEquation( _WindDirection2249_g3450 );
			float2 break2469_g3450 = localDirectionalEquation2249_g3450;
			float _WIND_DIRECTION_X2418_g3450 = break2469_g3450.x;
			float lerpResult2258_g3450 = lerp( break2265_g3450.x , ( ( break2265_g3450.y * FUNC_Angle_SinA2424_g3450 ) + ( break2265_g3450.x * FUNC_Angle_CosA2362_g3450 ) ) , _WIND_DIRECTION_X2418_g3450);
			float3 break2340_g3450 = VERTEX_POSITION_MATRIX2352_g3450;
			float3 break2233_g3450 = VERTEX_POSITION_MATRIX2352_g3450;
			float _WIND_DIRECTION_Y2416_g3450 = break2469_g3450.y;
			float lerpResult2275_g3450 = lerp( break2233_g3450.z , ( ( break2233_g3450.y * FUNC_Angle_SinA2424_g3450 ) + ( break2233_g3450.z * FUNC_Angle_CosA2362_g3450 ) ) , _WIND_DIRECTION_Y2416_g3450);
			float3 appendResult2235_g3450 = (float3(lerpResult2258_g3450 , ( ( break2340_g3450.y * FUNC_Angle_CosA2362_g3450 ) - ( break2340_g3450.z * FUNC_Angle_SinA2424_g3450 ) ) , lerpResult2275_g3450));
			float3 VERTEX_POSITION2282_g3450 = ( mul( unity_WorldToObject, float4( appendResult2235_g3450 , 0.0 ) ).xyz - ase_vertex3Pos );
			float3 m_Global2453_g3450 = VERTEX_POSITION2282_g3450;
			float3 m_Local2453_g3450 = VERTEX_POSITION2282_g3450;
			float3 localfloat3switch2453_g3450 = float3switch2453_g3450( m_switch2453_g3450 , m_Off2453_g3450 , m_Global2453_g3450 , m_Local2453_g3450 );
			float3 m_Off3050_g3450 = localfloat3switch2453_g3450;
			float3 ase_worldPos = mul( unity_ObjectToWorld, v.vertex );
			float temp_output_3048_0_g3450 = saturate( pow( ( distance( _WorldSpaceCameraPos , ase_worldPos ) / _Global_Wind_Main_Fade_Bias ) , 5.0 ) );
			float3 m_ActiveFadeOut3050_g3450 = ( localfloat3switch2453_g3450 * ( 1.0 - temp_output_3048_0_g3450 ) );
			float3 m_ActiveFadeIn3050_g3450 = ( localfloat3switch2453_g3450 * temp_output_3048_0_g3450 );
			float3 localfloat3switch3050_g3450 = float3switch3050_g3450( m_switch3050_g3450 , m_Off3050_g3450 , m_ActiveFadeOut3050_g3450 , m_ActiveFadeIn3050_g3450 );
			float3 temp_output_309_0_g38550 = localfloat3switch3050_g3450;
			v.vertex.xyz += temp_output_309_0_g38550;
			v.vertex.w = 1;
		}

		void surf( Input i , inout SurfaceOutputStandard o )
		{
			int m_switch103_g39599 = _Vertical_RainMode;
			int SURFACE_MAP_MODE122_g39591 = _EnableDetailMap;
			int m_switch127_g39591 = SURFACE_MAP_MODE122_g39591;
			float2 appendResult150_g38550 = (float2(_TilingX , _TilingY));
			float2 appendResult151_g38550 = (float2(_OffsetX , _OffsetY));
			float2 uv_TexCoord2_g39586 = i.uv_texcoord * appendResult150_g38550 + appendResult151_g38550;
			float2 appendResult6_g39586 = (float2(uv_TexCoord2_g39586.x , uv_TexCoord2_g39586.y));
			float2 OUT_UV431_g38550 = appendResult6_g39586;
			float2 UV40_g39580 = OUT_UV431_g38550;
			float4 OUT_NORMAL1178_g38550 = SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, UV40_g39580 );
			float4 temp_output_1_0_g39549 = OUT_NORMAL1178_g38550;
			float temp_output_8_0_g39549 = _NormalStrength;
			float3 temp_output_1478_59_g38550 = UnpackScaleNormal( temp_output_1_0_g39549, temp_output_8_0_g39549 );
			float3 temp_output_38_0_g39591 = temp_output_1478_59_g38550;
			float3 NORMAL_IN260_g39591 = temp_output_38_0_g39591;
			float3 m_Off127_g39591 = NORMAL_IN260_g39591;
			int EnableDetailMask216_g39591 = _EnableDetailMask;
			int m_switch221_g39591 = EnableDetailMask216_g39591;
			float2 appendResult132_g39591 = (float2(_DetailTilingXDetail , _DetailTilingYDetail));
			float2 appendResult114_g39591 = (float2(_DetailOffsetXDetail , _DetailOffsetYDetail));
			float2 uv_TexCoord67_g39591 = i.uv_texcoord * appendResult132_g39591 + appendResult114_g39591;
			float4 temp_output_1_0_g39596 = SAMPLE_TEXTURE2D( _DetailNormalMap, sampler_trilinear_repeat, uv_TexCoord67_g39591 );
			float temp_output_8_0_g39596 = _DetailNormalMapScale;
			float3 NORMAL_OUT199_g39591 = UnpackScaleNormal( temp_output_1_0_g39596, temp_output_8_0_g39596 );
			float3 m_Off221_g39591 = NORMAL_OUT199_g39591;
			float2 appendResult219_g39591 = (float2(_DetailTilingXDetailMask , _DetailTilingYDetailMask));
			float2 appendResult206_g39591 = (float2(_DetailOffsetXDetailMask , _DetailOffsetYDetailMask));
			float2 uv_TexCoord220_g39591 = i.uv_texcoord * appendResult219_g39591 + appendResult206_g39591;
			float temp_output_15_0_g39595 = ( 1.0 - SAMPLE_TEXTURE2D( _DetailMaskMap, sampler_trilinear_repeat, uv_TexCoord220_g39591 ).r );
			float temp_output_26_0_g39595 = _Detail_BlendAmountMask;
			float temp_output_24_0_g39595 = _Detail_BlendHardnessMask;
			float saferPower2_g39595 = max( max( saturate( (0.0 + (temp_output_15_0_g39595 - ( 1.0 - temp_output_26_0_g39595 )) * (temp_output_24_0_g39595 - 0.0) / (1.0 - ( 1.0 - temp_output_26_0_g39595 ))) ) , 0.0 ) , 0.0001 );
			float temp_output_22_0_g39595 = _Detail_BlendFalloffMask;
			float temp_output_403_0_g39591 = saturate( pow( saferPower2_g39595 , ( 1.0 - temp_output_22_0_g39595 ) ) );
			float3 lerpResult205_g39591 = lerp( NORMAL_IN260_g39591 , NORMAL_OUT199_g39591 , temp_output_403_0_g39591);
			float3 m_Active221_g39591 = saturate( lerpResult205_g39591 );
			float saferPower11_g39595 = max( max( saturate( (1.0 + (temp_output_15_0_g39595 - temp_output_26_0_g39595) * (( 1.0 - temp_output_24_0_g39595 ) - 1.0) / (0.0 - temp_output_26_0_g39595)) ) , 0.0 ) , 0.0001 );
			float temp_output_403_21_g39591 = saturate( pow( saferPower11_g39595 , temp_output_22_0_g39595 ) );
			float3 lerpResult406_g39591 = lerp( NORMAL_OUT199_g39591 , NORMAL_IN260_g39591 , temp_output_403_21_g39591);
			float3 m_ActiveInverted221_g39591 = saturate( lerpResult406_g39591 );
			float3 localfloat3switch221_g39591 = float3switch221_g39591( m_switch221_g39591 , m_Off221_g39591 , m_Active221_g39591 , m_ActiveInverted221_g39591 );
			float3 MASK_NORMAL_OUT222_g39591 = localfloat3switch221_g39591;
			float4 tex2DNode63_g39580 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g39580 );
			float4 OUT_ALBEDO_RGBA1177_g38550 = tex2DNode63_g39580;
			float3 temp_output_7_0_g38550 = ( (_Color).rgb * (OUT_ALBEDO_RGBA1177_g38550).rgb * _Brightness );
			float4 temp_output_39_0_g39591 = ( float4( temp_output_7_0_g38550 , 0.0 ) + float4(0,0,0,0) );
			float4 break48_g39591 = temp_output_39_0_g39591;
			float ALBEDO_IN_RGB300_g39591 = ( break48_g39591.x + break48_g39591.y + break48_g39591.z );
			int m_switch319_g39591 = _BlendColor;
			float m_Red319_g39591 = i.vertexColor.r;
			float m_Green319_g39591 = i.vertexColor.g;
			float m_Blue319_g39591 = i.vertexColor.b;
			float localfloatswitch319_g39591 = floatswitch319_g39591( m_switch319_g39591 , m_Red319_g39591 , m_Green319_g39591 , m_Blue319_g39591 );
			float clampResult47_g39591 = clamp( ( ( ( ( ALBEDO_IN_RGB300_g39591 - 0.5 ) * ( _DetailBlendInfluence - 0.9 ) ) + ( localfloatswitch319_g39591 - ( _BlendHeight - 0.4 ) ) ) / _DetailBlendSmooth ) , 0.0 , 1.0 );
			float DETAIL_BLEND43_g39591 = clampResult47_g39591;
			float3 lerpResult62_g39591 = lerp( MASK_NORMAL_OUT222_g39591 , NORMAL_IN260_g39591 , DETAIL_BLEND43_g39591);
			float3 temp_output_318_0_g39591 = ( NORMAL_IN260_g39591 + saturate( lerpResult62_g39591 ) );
			float3 m_Active127_g39591 = temp_output_318_0_g39591;
			float3 localfloat3switch127_g39591 = float3switch127_g39591( m_switch127_g39591 , m_Off127_g39591 , m_Active127_g39591 );
			float3 temp_output_19_0_g39599 = localfloat3switch127_g39591;
			float3 NORMAL_IN105_g39599 = temp_output_19_0_g39599;
			float3 m_Off103_g39599 = NORMAL_IN105_g39599;
			int m_switch914_g39599 = _Vertical_ModeUV;
			float3 _MASK_VECTOR1485_g39599 = float3(0.001,0.001,0.001);
			float2 appendResult259_g39599 = (float2(_Vertical_TilingX , _Vertical_TilingY));
			float2 VERTICAL_UV_TILING377_g39599 = appendResult259_g39599;
			float2 UV_TILING88_g39610 = VERTICAL_UV_TILING377_g39599;
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float3 objToWorld137_g39610 = mul( unity_ObjectToWorld, float4( ase_vertex3Pos, 1 ) ).xyz;
			float2 appendResult129_g39610 = (float2(-objToWorld137_g39610.x , objToWorld137_g39610.y));
			float4 ase_screenPos = float4( i.screenPos.xyz , i.screenPos.w + 0.00000000001 );
			float4 ase_screenPosNorm = ase_screenPos / ase_screenPos.w;
			ase_screenPosNorm.z = ( UNITY_NEAR_CLIP_VALUE >= 0 ) ? ase_screenPosNorm.z : ase_screenPosNorm.z * 0.5 + 0.5;
			float temp_output_52_0_g39610 = _Vertical_Columns;
			float temp_output_53_0_g39610 = _Vertical_Rows;
			float2 appendResult1_g39610 = (float2(temp_output_52_0_g39610 , temp_output_53_0_g39610));
			float VERTICAL_FRAMES15_g39610 = ( temp_output_52_0_g39610 * temp_output_53_0_g39610 );
			float2 appendResult49_g39610 = (float2(VERTICAL_FRAMES15_g39610 , temp_output_53_0_g39610));
			float clampResult37_g39610 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g39610 - 1.0 ) );
			float temp_output_36_0_g39610 = frac( ( ( ( _Time.y * _Vertical_Speed ) + clampResult37_g39610 ) / VERTICAL_FRAMES15_g39610 ) );
			float2 appendResult31_g39610 = (float2(temp_output_36_0_g39610 , ( 1.0 - temp_output_36_0_g39610 )));
			float2 _UV_VERTICAL_X_DOWN863_g39599 = ( ( ( ( UV_TILING88_g39610 * appendResult129_g39610 ) + ( (ase_screenPosNorm).xy * _Vertical_ScreenContribution ) ) / appendResult1_g39610 ) + ( floor( ( appendResult49_g39610 * appendResult31_g39610 ) ) / appendResult1_g39610 ) );
			int _Global_Rain_Enabled1178_g39599 = _Global_Rain_Enabled;
			int m_switch1190_g39599 = _Global_Rain_Enabled1178_g39599;
			float m_Off1190_g39599 = _Vertical_Intensity;
			float _Global_Rain_Intensity1174_g39599 = _Global_Rain_Intensity;
			float m_Active1190_g39599 = ( _Vertical_Intensity * _Global_Rain_Intensity1174_g39599 );
			float localfloatswitch1190_g39599 = floatswitch1190_g39599( m_switch1190_g39599 , m_Off1190_g39599 , m_Active1190_g39599 );
			float _VERTICAL_INTENSITY861_g39599 = saturate( localfloatswitch1190_g39599 );
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 temp_cast_3 = (0.5).xxx;
			float3 break149_g39599 = ( abs( ase_worldNormal ) - temp_cast_3 );
			float smoothstepResult1521_g39599 = smoothstep( _Vertical_SmoothEdge , 1.0 , ( break149_g39599.z + 0.5 ));
			float _MASK_VERTICAL_Z1241_g39599 = smoothstepResult1521_g39599;
			float3 lerpResult1138_g39599 = lerp( _MASK_VECTOR1485_g39599 , UnpackScaleNormal( SAMPLE_TEXTURE2D( _Vertical_RainMap, sampler_trilinear_repeat, _UV_VERTICAL_X_DOWN863_g39599 ), _VERTICAL_INTENSITY861_g39599 ) , _MASK_VERTICAL_Z1241_g39599);
			float2 UV_TILING88_g39600 = VERTICAL_UV_TILING377_g39599;
			float3 objToWorld137_g39600 = mul( unity_ObjectToWorld, float4( ase_vertex3Pos, 1 ) ).xyz;
			float2 appendResult115_g39600 = (float2(objToWorld137_g39600.z , objToWorld137_g39600.y));
			float temp_output_52_0_g39600 = _Vertical_Columns;
			float temp_output_53_0_g39600 = _Vertical_Rows;
			float2 appendResult1_g39600 = (float2(temp_output_52_0_g39600 , temp_output_53_0_g39600));
			float VERTICAL_FRAMES15_g39600 = ( temp_output_52_0_g39600 * temp_output_53_0_g39600 );
			float2 appendResult49_g39600 = (float2(VERTICAL_FRAMES15_g39600 , temp_output_53_0_g39600));
			float clampResult37_g39600 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g39600 - 1.0 ) );
			float temp_output_36_0_g39600 = frac( ( ( ( _Time.y * _Vertical_Speed ) + clampResult37_g39600 ) / VERTICAL_FRAMES15_g39600 ) );
			float2 appendResult31_g39600 = (float2(temp_output_36_0_g39600 , ( 1.0 - temp_output_36_0_g39600 )));
			float2 _UV_VERTICAL_Y_DOWN870_g39599 = ( ( ( ( UV_TILING88_g39600 * appendResult115_g39600 ) + ( (ase_screenPosNorm).xy * _Vertical_ScreenContribution ) ) / appendResult1_g39600 ) + ( floor( ( appendResult49_g39600 * appendResult31_g39600 ) ) / appendResult1_g39600 ) );
			float2 _SmoothX = float2(0,1);
			float smoothstepResult1523_g39599 = smoothstep( _SmoothX.x , _SmoothX.y , ( break149_g39599.x + 0.45 ));
			float _MASK_VERTICAL_X151_g39599 = smoothstepResult1523_g39599;
			float3 lerpResult1261_g39599 = lerp( _MASK_VECTOR1485_g39599 , UnpackScaleNormal( SAMPLE_TEXTURE2D( _Vertical_RainMap, sampler_trilinear_repeat, _UV_VERTICAL_Y_DOWN870_g39599 ), _VERTICAL_INTENSITY861_g39599 ) , _MASK_VERTICAL_X151_g39599);
			float2 _SmoothY = float2(0,1);
			float smoothstepResult1519_g39599 = smoothstep( _SmoothY.x , _SmoothY.y , ( -break149_g39599.y + 0.45 ));
			float _MASK_VERTICAL_Y1216_g39599 = smoothstepResult1519_g39599;
			float3 lerpResult1390_g39599 = lerp( lerpResult1138_g39599 , BlendNormals( lerpResult1138_g39599 , lerpResult1261_g39599 ) , _MASK_VERTICAL_Y1216_g39599);
			float3 m_Standard914_g39599 = lerpResult1390_g39599;
			float localStochasticTiling895_g39599 = ( 0.0 );
			float2 UV895_g39599 = _UV_VERTICAL_X_DOWN863_g39599;
			float2 UV1895_g39599 = float2( 0,0 );
			float2 UV2895_g39599 = float2( 0,0 );
			float2 UV3895_g39599 = float2( 0,0 );
			float W1895_g39599 = 0.0;
			float W2895_g39599 = 0.0;
			float W3895_g39599 = 0.0;
			StochasticTiling( UV895_g39599 , UV1895_g39599 , UV2895_g39599 , UV3895_g39599 , W1895_g39599 , W2895_g39599 , W3895_g39599 );
			float2 temp_output_906_0_g39599 = ddx( _UV_VERTICAL_X_DOWN863_g39599 );
			float2 temp_output_886_0_g39599 = ddy( _UV_VERTICAL_X_DOWN863_g39599 );
			float UV1_V1_W1887_g39599 = W1895_g39599;
			float UV1_V1_W2897_g39599 = W2895_g39599;
			float UV1_V1_W3926_g39599 = W3895_g39599;
			float3 lerpResult950_g39599 = lerp( _MASK_VECTOR1485_g39599 , ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV1895_g39599, temp_output_906_0_g39599, temp_output_886_0_g39599 ), _VERTICAL_INTENSITY861_g39599 ) * UV1_V1_W1887_g39599 ) + ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV2895_g39599, temp_output_906_0_g39599, temp_output_886_0_g39599 ), _VERTICAL_INTENSITY861_g39599 ) * UV1_V1_W2897_g39599 ) + ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV3895_g39599, temp_output_906_0_g39599, temp_output_886_0_g39599 ), _VERTICAL_INTENSITY861_g39599 ) * UV1_V1_W3926_g39599 ) ) ) , _MASK_VERTICAL_Z1241_g39599);
			float localStochasticTiling865_g39599 = ( 0.0 );
			float2 UV865_g39599 = _UV_VERTICAL_Y_DOWN870_g39599;
			float2 UV1865_g39599 = float2( 0,0 );
			float2 UV2865_g39599 = float2( 0,0 );
			float2 UV3865_g39599 = float2( 0,0 );
			float W1865_g39599 = 0.0;
			float W2865_g39599 = 0.0;
			float W3865_g39599 = 0.0;
			StochasticTiling( UV865_g39599 , UV1865_g39599 , UV2865_g39599 , UV3865_g39599 , W1865_g39599 , W2865_g39599 , W3865_g39599 );
			float2 temp_output_883_0_g39599 = ddx( _UV_VERTICAL_Y_DOWN870_g39599 );
			float2 temp_output_894_0_g39599 = ddy( _UV_VERTICAL_Y_DOWN870_g39599 );
			float UV1_V2_W1866_g39599 = W1865_g39599;
			float UV1_V2_W2884_g39599 = W2865_g39599;
			float UV1_V2_W3871_g39599 = W3865_g39599;
			float3 lerpResult946_g39599 = lerp( _MASK_VECTOR1485_g39599 , ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV1865_g39599, temp_output_883_0_g39599, temp_output_894_0_g39599 ), _VERTICAL_INTENSITY861_g39599 ) * UV1_V2_W1866_g39599 ) + ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV2865_g39599, temp_output_883_0_g39599, temp_output_894_0_g39599 ), _VERTICAL_INTENSITY861_g39599 ) * UV1_V2_W2884_g39599 ) + ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Vertical_RainMap, sampler_trilinear_repeat, UV3865_g39599, temp_output_883_0_g39599, temp_output_894_0_g39599 ), _VERTICAL_INTENSITY861_g39599 ) * UV1_V2_W3871_g39599 ) ) ) , _MASK_VERTICAL_X151_g39599);
			float3 lerpResult1400_g39599 = lerp( lerpResult950_g39599 , BlendNormals( lerpResult950_g39599 , lerpResult946_g39599 ) , _MASK_VERTICAL_Y1216_g39599);
			float3 m_Stochastic914_g39599 = lerpResult1400_g39599;
			float3 localfloat3switch914_g39599 = float3switch914_g39599( m_switch914_g39599 , m_Standard914_g39599 , m_Stochastic914_g39599 );
			float3 RAIN_VERTICAL127_g39599 = localfloat3switch914_g39599;
			int m_switch99_g39551 = _SmoothnessModeSurface;
			int m_switch170_g39551 = _SmoothnessType;
			float4 temp_cast_4 = (_SmoothnessStrength).xxxx;
			float4 m_Smoothness170_g39551 = temp_cast_4;
			float4 temp_cast_5 = (( 1.0 - _SmoothnessStrength )).xxxx;
			float4 m_Roughness170_g39551 = temp_cast_5;
			float4 localfloat4switch170_g39551 = float4switch170_g39551( m_switch170_g39551 , m_Smoothness170_g39551 , m_Roughness170_g39551 );
			float4 FINAL_STANDARD111_g39551 = localfloat4switch170_g39551;
			float4 m_Standard99_g39551 = FINAL_STANDARD111_g39551;
			float3 NORMAL_WORLD_OUT164_g38550 = temp_output_1478_59_g38550;
			float3 temp_output_4_0_g39551 = NORMAL_WORLD_OUT164_g38550;
			float3 temp_output_23_0_g39551 = ddx( temp_output_4_0_g39551 );
			float dotResult25_g39551 = dot( temp_output_23_0_g39551 , temp_output_23_0_g39551 );
			float3 temp_output_7_0_g39551 = ddy( temp_output_4_0_g39551 );
			float dotResult27_g39551 = dot( temp_output_7_0_g39551 , temp_output_7_0_g39551 );
			float temp_output_28_0_g39551 = sqrt( saturate( ( ( _SmoothnessStrength * _SmoothnessStrength ) + min( ( ( _SmoothnessVariance * ( dotResult25_g39551 + dotResult27_g39551 ) ) * 2.0 ) , ( _SmoothnessThreshold * _SmoothnessThreshold ) ) ) ) );
			float4 break377_g38550 = OUT_ALBEDO_RGBA1177_g38550;
			float ALBEDO_R169_g38550 = break377_g38550.r;
			float4 temp_cast_6 = (ALBEDO_R169_g38550).xxxx;
			float4 FINAL_GEOMETRIC114_g39551 = ( temp_output_28_0_g39551 * ( 1.0 - temp_cast_6 ) );
			float4 m_Geometric99_g39551 = FINAL_GEOMETRIC114_g39551;
			int SMOOTHNESS_TYPE173_g39551 = _SmoothnessType;
			int m_switch167_g39551 = SMOOTHNESS_TYPE173_g39551;
			float4 _MASK_G1438_g38550 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, UV40_g39580 );
			float4 temp_output_83_0_g39551 = _MASK_G1438_g38550;
			float4 m_Smoothness167_g39551 = temp_output_83_0_g39551;
			float4 m_Roughness167_g39551 = ( 1.0 - temp_output_83_0_g39551 );
			float4 localfloat4switch167_g39551 = float4switch167_g39551( m_switch167_g39551 , m_Smoothness167_g39551 , m_Roughness167_g39551 );
			float4 FINAL_SMOOTHNESS_TEXTURE117_g39551 = ( temp_output_28_0_g39551 * localfloat4switch167_g39551 );
			float4 m_Texture99_g39551 = FINAL_SMOOTHNESS_TEXTURE117_g39551;
			float4 localfloat4switch99_g39551 = float4switch99_g39551( m_switch99_g39551 , m_Standard99_g39551 , m_Geometric99_g39551 , m_Texture99_g39551 );
			float4 temp_output_1267_33_g38550 = localfloat4switch99_g39551;
			float4 color301_g38550 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float4 _MASK_R1439_g38550 = SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, UV40_g39580 );
			float4 temp_cast_8 = (i.vertexColor.a).xxxx;
			float4 lerpResult11_g38550 = lerp( _MASK_R1439_g38550 , temp_cast_8 , (float)_OcclusionSourceMode);
			float4 lerpResult14_g38550 = lerp( color301_g38550 , lerpResult11_g38550 , _OcclusionStrengthAO);
			float4 temp_output_23_0_g39599 = ( temp_output_1267_33_g38550 * lerpResult14_g38550 );
			float4 lerpResult144_g39599 = lerp( temp_output_23_0_g39599 , ( temp_output_23_0_g39599 * 0.05 ) , i.vertexColor.r);
			float4 temp_cast_11 = (0.7).xxxx;
			float4 SMOOTHNESS94_g39599 = step( step( lerpResult144_g39599 , temp_cast_11 ) , float4( 0,0,0,0 ) );
			float3 lerpResult42_g39599 = lerp( RAIN_VERTICAL127_g39599 , float3( 0,0,0 ) , SMOOTHNESS94_g39599.xyz);
			float3 temp_output_26_0_g39605 = float3( 0,0,0 );
			float3 m_Active103_g39599 = BlendNormals( temp_output_19_0_g39599 , ( ( lerpResult42_g39599 - temp_output_26_0_g39605 ) / ( float3( 1,1,1 ) - temp_output_26_0_g39605 ) ) );
			float3 localfloat3switch103_g39599 = float3switch( m_switch103_g39599 , m_Off103_g39599 , m_Active103_g39599 );
			int m_switch1010_g39599 = _Static_RainMode;
			float3 m_Off1010_g39599 = NORMAL_IN105_g39599;
			int m_switch992_g39599 = _Static_ModeUV;
			float2 appendResult737_g39599 = (float2(_Static_TilingX , _Static_TilingY));
			float2 appendResult738_g39599 = (float2(_Static_OffsetX , _Static_OffsetY));
			float2 uv_TexCoord736_g39599 = i.uv_texcoord * appendResult737_g39599 + appendResult738_g39599;
			float2 appendResult731_g39599 = (float2(frac( uv_TexCoord736_g39599.x ) , frac( uv_TexCoord736_g39599.y )));
			float2 _STATIC_UV01_OUT990_g39599 = ( appendResult731_g39599 + ( (ase_screenPosNorm).xy * _Static_ScreenContribution ) );
			int m_switch1186_g39599 = _Global_Rain_Enabled1178_g39599;
			float m_Off1186_g39599 = _Static_Intensity;
			float m_Active1186_g39599 = ( _Static_Intensity * _Global_Rain_Intensity1174_g39599 );
			float localfloatswitch1186_g39599 = floatswitch1186_g39599( m_switch1186_g39599 , m_Off1186_g39599 , m_Active1186_g39599 );
			float _STATIC_INTENSITY991_g39599 = saturate( localfloatswitch1186_g39599 );
			float3 m_Standard992_g39599 = UnpackScaleNormal( SAMPLE_TEXTURE2D( _Static_RainMap, sampler_trilinear_repeat, _STATIC_UV01_OUT990_g39599 ), _STATIC_INTENSITY991_g39599 );
			float localStochasticTiling973_g39599 = ( 0.0 );
			float2 UV973_g39599 = _STATIC_UV01_OUT990_g39599;
			float2 UV1973_g39599 = float2( 0,0 );
			float2 UV2973_g39599 = float2( 0,0 );
			float2 UV3973_g39599 = float2( 0,0 );
			float W1973_g39599 = 0.0;
			float W2973_g39599 = 0.0;
			float W3973_g39599 = 0.0;
			StochasticTiling( UV973_g39599 , UV1973_g39599 , UV2973_g39599 , UV3973_g39599 , W1973_g39599 , W2973_g39599 , W3973_g39599 );
			float2 temp_output_977_0_g39599 = ddx( _STATIC_UV01_OUT990_g39599 );
			float2 temp_output_978_0_g39599 = ddy( _STATIC_UV01_OUT990_g39599 );
			float UV1_S1_W1975_g39599 = W1973_g39599;
			float UV1_S1_W2972_g39599 = W2973_g39599;
			float UV1_S1_W3976_g39599 = W3973_g39599;
			float3 m_Stochastic992_g39599 = ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Static_RainMap, sampler_trilinear_repeat, UV1973_g39599, temp_output_977_0_g39599, temp_output_978_0_g39599 ), _STATIC_INTENSITY991_g39599 ) * UV1_S1_W1975_g39599 ) + ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Static_RainMap, sampler_trilinear_repeat, UV2973_g39599, temp_output_977_0_g39599, temp_output_978_0_g39599 ), _STATIC_INTENSITY991_g39599 ) * UV1_S1_W2972_g39599 ) + ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Static_RainMap, sampler_trilinear_repeat, UV3973_g39599, temp_output_977_0_g39599, temp_output_978_0_g39599 ), _STATIC_INTENSITY991_g39599 ) * UV1_S1_W3976_g39599 ) ) );
			float3 localfloat3switch992_g39599 = float3switch992_g39599( m_switch992_g39599 , m_Standard992_g39599 , m_Stochastic992_g39599 );
			float3 RAIN_STATIC743_g39599 = localfloat3switch992_g39599;
			float3 lerpResult1005_g39599 = lerp( RAIN_STATIC743_g39599 , float3( 0,0,0 ) , SMOOTHNESS94_g39599.xyz);
			float3 temp_output_26_0_g39616 = float3( 0,0,0 );
			float3 m_Active1010_g39599 = BlendNormals( temp_output_19_0_g39599 , ( ( lerpResult1005_g39599 - temp_output_26_0_g39616 ) / ( float3( 1,1,1 ) - temp_output_26_0_g39616 ) ) );
			float3 localfloat3switch1010_g39599 = float3switch( m_switch1010_g39599 , m_Off1010_g39599 , m_Active1010_g39599 );
			int m_switch1009_g39599 = _Horizontal_RainMode;
			float3 m_Off1009_g39599 = NORMAL_IN105_g39599;
			int m_switch1505_g39599 = _Horizontal_ModeUV;
			float2 appendResult269_g39599 = (float2(_Horizontal_TilingX , _Horizontal_TilingY));
			float2 HORIZONTAL_UV_TILING158_g39599 = appendResult269_g39599;
			float2 UV_TILING88_g39614 = HORIZONTAL_UV_TILING158_g39599;
			float2 appendResult271_g39599 = (float2(_Horizontal_OffsetX , _Horizontal_OffsetY));
			float2 HORIZONTAL_UV_OFFSET159_g39599 = appendResult271_g39599;
			float2 UV_OFFSET94_g39614 = HORIZONTAL_UV_OFFSET159_g39599;
			float2 uv_TexCoord87_g39614 = i.uv_texcoord * UV_TILING88_g39614 + UV_OFFSET94_g39614;
			float2 appendResult86_g39614 = (float2(frac( uv_TexCoord87_g39614.x ) , frac( uv_TexCoord87_g39614.y )));
			float temp_output_52_0_g39614 = _Horizontal_Columns;
			float temp_output_53_0_g39614 = _Horizontal_Rows;
			float2 appendResult1_g39614 = (float2(temp_output_52_0_g39614 , temp_output_53_0_g39614));
			float VERTICAL_FRAMES15_g39614 = ( temp_output_52_0_g39614 * temp_output_53_0_g39614 );
			float2 appendResult49_g39614 = (float2(VERTICAL_FRAMES15_g39614 , temp_output_53_0_g39614));
			float clampResult37_g39614 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g39614 - 1.0 ) );
			float temp_output_36_0_g39614 = frac( ( ( ( _Time.y * _Horizontal_Speed ) + clampResult37_g39614 ) / VERTICAL_FRAMES15_g39614 ) );
			float2 appendResult31_g39614 = (float2(temp_output_36_0_g39614 , ( 1.0 - temp_output_36_0_g39614 )));
			float2 UV_HORIZONTAL_DEFAULT_01817_g39599 = ( ( ( appendResult86_g39614 + ( (ase_screenPosNorm).xy * _Horizontal_ScreenContribution ) ) / appendResult1_g39614 ) + ( floor( ( appendResult49_g39614 * appendResult31_g39614 ) ) / appendResult1_g39614 ) );
			int m_switch1179_g39599 = _Global_Rain_Enabled1178_g39599;
			float m_Off1179_g39599 = _Horizontal_Intensity;
			float m_Active1179_g39599 = ( _Horizontal_Intensity * _Global_Rain_Intensity1174_g39599 );
			float localfloatswitch1179_g39599 = floatswitch1179_g39599( m_switch1179_g39599 , m_Off1179_g39599 , m_Active1179_g39599 );
			float _HORIZONTAL_INTENSITY814_g39599 = saturate( localfloatswitch1179_g39599 );
			float2 UV_TILING88_g39602 = ( HORIZONTAL_UV_TILING158_g39599 / float2( 0.6,0.6 ) );
			float2 UV_OFFSET94_g39602 = ( HORIZONTAL_UV_OFFSET159_g39599 + float2( 0.3,0.3 ) );
			float2 uv_TexCoord87_g39602 = i.uv_texcoord * UV_TILING88_g39602 + UV_OFFSET94_g39602;
			float2 appendResult86_g39602 = (float2(frac( uv_TexCoord87_g39602.x ) , frac( uv_TexCoord87_g39602.y )));
			float temp_output_52_0_g39602 = _Horizontal_Columns;
			float temp_output_53_0_g39602 = _Horizontal_Rows;
			float2 appendResult1_g39602 = (float2(temp_output_52_0_g39602 , temp_output_53_0_g39602));
			float VERTICAL_FRAMES15_g39602 = ( temp_output_52_0_g39602 * temp_output_53_0_g39602 );
			float2 appendResult49_g39602 = (float2(VERTICAL_FRAMES15_g39602 , temp_output_53_0_g39602));
			float clampResult37_g39602 = clamp( 0.0 , 0.0001 , ( VERTICAL_FRAMES15_g39602 - 1.0 ) );
			float temp_output_36_0_g39602 = frac( ( ( ( _Time.y * _Horizontal_Speed ) + clampResult37_g39602 ) / VERTICAL_FRAMES15_g39602 ) );
			float2 appendResult31_g39602 = (float2(temp_output_36_0_g39602 , ( 1.0 - temp_output_36_0_g39602 )));
			float2 UV_HORIZONTAL_DEFAULT_02818_g39599 = ( ( ( appendResult86_g39602 + ( (ase_screenPosNorm).xy * _Horizontal_ScreenContribution ) ) / appendResult1_g39602 ) + ( floor( ( appendResult49_g39602 * appendResult31_g39602 ) ) / appendResult1_g39602 ) );
			float3 m_Standard1505_g39599 = BlendNormals( UnpackScaleNormal( SAMPLE_TEXTURE2D( _Horizontal_RainMap, sampler_trilinear_repeat, UV_HORIZONTAL_DEFAULT_01817_g39599 ), _HORIZONTAL_INTENSITY814_g39599 ) , UnpackScaleNormal( SAMPLE_TEXTURE2D( _Horizontal_RainMap, sampler_trilinear_repeat, UV_HORIZONTAL_DEFAULT_02818_g39599 ), _HORIZONTAL_INTENSITY814_g39599 ) );
			float localStochasticTiling800_g39599 = ( 0.0 );
			float2 UV800_g39599 = UV_HORIZONTAL_DEFAULT_01817_g39599;
			float2 UV1800_g39599 = float2( 0,0 );
			float2 UV2800_g39599 = float2( 0,0 );
			float2 UV3800_g39599 = float2( 0,0 );
			float W1800_g39599 = 0.0;
			float W2800_g39599 = 0.0;
			float W3800_g39599 = 0.0;
			StochasticTiling( UV800_g39599 , UV1800_g39599 , UV2800_g39599 , UV3800_g39599 , W1800_g39599 , W2800_g39599 , W3800_g39599 );
			float2 temp_output_804_0_g39599 = ddx( UV_HORIZONTAL_DEFAULT_01817_g39599 );
			float2 temp_output_797_0_g39599 = ddy( UV_HORIZONTAL_DEFAULT_01817_g39599 );
			float UV1_H1_W1805_g39599 = W1800_g39599;
			float UV1_H1_W2803_g39599 = W2800_g39599;
			float UV1_H1_W3812_g39599 = W3800_g39599;
			float localStochasticTiling781_g39599 = ( 0.0 );
			float2 UV781_g39599 = UV_HORIZONTAL_DEFAULT_02818_g39599;
			float2 UV1781_g39599 = float2( 0,0 );
			float2 UV2781_g39599 = float2( 0,0 );
			float2 UV3781_g39599 = float2( 0,0 );
			float W1781_g39599 = 0.0;
			float W2781_g39599 = 0.0;
			float W3781_g39599 = 0.0;
			StochasticTiling( UV781_g39599 , UV1781_g39599 , UV2781_g39599 , UV3781_g39599 , W1781_g39599 , W2781_g39599 , W3781_g39599 );
			float2 temp_output_788_0_g39599 = ddx( UV_HORIZONTAL_DEFAULT_02818_g39599 );
			float2 temp_output_777_0_g39599 = ddy( UV_HORIZONTAL_DEFAULT_02818_g39599 );
			float UV1_H2_W1789_g39599 = W1781_g39599;
			float UV1_H2_W2787_g39599 = W2781_g39599;
			float UV1_H2_W3785_g39599 = W3781_g39599;
			float3 m_Stochastic1505_g39599 = BlendNormals( ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV1800_g39599, temp_output_804_0_g39599, temp_output_797_0_g39599 ), _HORIZONTAL_INTENSITY814_g39599 ) * UV1_H1_W1805_g39599 ) + ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV2800_g39599, temp_output_804_0_g39599, temp_output_797_0_g39599 ), _HORIZONTAL_INTENSITY814_g39599 ) * UV1_H1_W2803_g39599 ) + ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV3800_g39599, temp_output_804_0_g39599, temp_output_797_0_g39599 ), _HORIZONTAL_INTENSITY814_g39599 ) * UV1_H1_W3812_g39599 ) ) ) , ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV1781_g39599, temp_output_788_0_g39599, temp_output_777_0_g39599 ), _HORIZONTAL_INTENSITY814_g39599 ) * UV1_H2_W1789_g39599 ) + ( ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV2781_g39599, temp_output_788_0_g39599, temp_output_777_0_g39599 ), _HORIZONTAL_INTENSITY814_g39599 ) * UV1_H2_W2787_g39599 ) + ( UnpackScaleNormal( SAMPLE_TEXTURE2D_GRAD( _Horizontal_RainMap, sampler_trilinear_repeat, UV3781_g39599, temp_output_788_0_g39599, temp_output_777_0_g39599 ), _HORIZONTAL_INTENSITY814_g39599 ) * UV1_H2_W3785_g39599 ) ) ) );
			float3 localfloat3switch1505_g39599 = float3switch1505_g39599( m_switch1505_g39599 , m_Standard1505_g39599 , m_Stochastic1505_g39599 );
			float2 _SmoothH = float2(0,1);
			float smoothstepResult1517_g39599 = smoothstep( _SmoothH.x , _SmoothH.y , ( ase_worldNormal.y + 0.02 ));
			float _MASK_HORIZONTAL152_g39599 = smoothstepResult1517_g39599;
			float3 lerpResult279_g39599 = lerp( _MASK_VECTOR1485_g39599 , localfloat3switch1505_g39599 , _MASK_HORIZONTAL152_g39599);
			float3 RAIN_HORIZONTAL123_g39599 = lerpResult279_g39599;
			float3 lerpResult1002_g39599 = lerp( RAIN_HORIZONTAL123_g39599 , float3( 0,0,0 ) , SMOOTHNESS94_g39599.xyz);
			float3 temp_output_26_0_g39607 = float3( 0,0,0 );
			float3 m_Active1009_g39599 = BlendNormals( temp_output_19_0_g39599 , ( ( lerpResult1002_g39599 - temp_output_26_0_g39607 ) / ( float3( 1,1,1 ) - temp_output_26_0_g39607 ) ) );
			float3 localfloat3switch1009_g39599 = float3switch( m_switch1009_g39599 , m_Off1009_g39599 , m_Active1009_g39599 );
			o.Normal = ( localfloat3switch103_g39599 + localfloat3switch1010_g39599 + localfloat3switch1009_g39599 );
			int m_switch125_g39591 = SURFACE_MAP_MODE122_g39591;
			float4 ALBEDO_IN_RGBA40_g39591 = temp_output_39_0_g39591;
			float4 m_Off125_g39591 = ALBEDO_IN_RGBA40_g39591;
			int m_switch226_g39591 = _EnableDetailMask;
			float4 tex2DNode45_g39591 = SAMPLE_TEXTURE2D( _DetailAlbedoMap, sampler_trilinear_repeat, uv_TexCoord67_g39591 );
			float4 ALBEDO_OUT255_g39591 = ( _ColorDetail * tex2DNode45_g39591 * _Brightness );
			float4 m_Off226_g39591 = ALBEDO_OUT255_g39591;
			float4 lerpResult225_g39591 = lerp( ALBEDO_IN_RGBA40_g39591 , ALBEDO_OUT255_g39591 , temp_output_403_0_g39591);
			float4 m_Active226_g39591 = lerpResult225_g39591;
			float4 lerpResult408_g39591 = lerp( ALBEDO_OUT255_g39591 , ALBEDO_IN_RGBA40_g39591 , temp_output_403_21_g39591);
			float4 m_ActiveInverted226_g39591 = lerpResult408_g39591;
			float4 localfloat4switch226_g39591 = float4switch226_g39591( m_switch226_g39591 , m_Off226_g39591 , m_Active226_g39591 , m_ActiveInverted226_g39591 );
			float4 MASK_ALBEDO_OUT258_g39591 = localfloat4switch226_g39591;
			float4 lerpResult58_g39591 = lerp( MASK_ALBEDO_OUT258_g39591 , ALBEDO_IN_RGBA40_g39591 , DETAIL_BLEND43_g39591);
			float4 m_Active125_g39591 = lerpResult58_g39591;
			float4 localfloat4switch125_g39591 = float4switch125_g39591( m_switch125_g39591 , m_Off125_g39591 , m_Active125_g39591 );
			float4 temp_output_746_0_g39599 = localfloat4switch125_g39591;
			o.Albedo = ( temp_output_746_0_g39599 * ( 1.0 - _Rain_WetnessDarken ) ).xyz;
			float4 _MASK_B1440_g38550 = SAMPLE_TEXTURE2D( _MetallicGlossMap, sampler_trilinear_repeat, UV40_g39580 );
			o.Metallic = ( _MetallicStrength * _MASK_B1440_g38550 ).r;
			int m_switch23_g39604 = _Rain_GlobalWetnessMode;
			float4 temp_output_17_0_g39604 = temp_output_23_0_g39599;
			float4 m_Off23_g39604 = temp_output_17_0_g39604;
			int m_switch12_g39604 = _Global_Wetness_Enabled;
			float4 m_Off12_g39604 = temp_output_17_0_g39604;
			float4 m_Active12_g39604 = saturate( ( temp_output_17_0_g39604 + _Global_Wetness_Intensity ) );
			float4 localfloat4switch12_g39604 = float4switch12_g39604( m_switch12_g39604 , m_Off12_g39604 , m_Active12_g39604 );
			float4 m_Active23_g39604 = localfloat4switch12_g39604;
			float4 localfloat4switch23_g39604 = float4switch23_g39604( m_switch23_g39604 , m_Off23_g39604 , m_Active23_g39604 );
			o.Smoothness = localfloat4switch23_g39604.x;
			o.Occlusion = saturate( lerpResult14_g38550 ).r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=18913
486;116;1467;857;-47.8414;969.4734;1;True;False
Node;AmplifyShaderEditor.FunctionNode;472;69.54865,-689.7054;Inherit;False;DESF Module Wind;130;;3450;b135a554f7e4d0b41bba02c61b34ae74;11,938,0,2881,0,2454,0,2457,0,2432,0,2434,0,2433,0,2371,0,2752,0,2995,0,2878,0;0;2;FLOAT3;2190;FLOAT4;2970
Node;AmplifyShaderEditor.FunctionNode;477;309.0241,-690.0609;Inherit;False;DESF Core Surface;3;;38550;c3df20d62907cd04086a1eacc41e29d1;19,1352,0,183,0,1382,1,1432,1,1433,1,1434,1,1491,0,1284,0,1446,0,307,0,312,0,1318,0,249,0,1319,0,1336,0,1337,0,1407,0,1443,0,1444,0;2;309;FLOAT3;0,0,0;False;1262;FLOAT4;0,0,0,0;False;10;FLOAT4;42;FLOAT3;39;FLOAT3;1473;COLOR;0;FLOAT4;41;COLOR;43;FLOAT;180;FLOAT;55;FLOAT;281;FLOAT3;313
Node;AmplifyShaderEditor.CommentaryNode;290;1375.96,-887.2607;Inherit;False;349.5028;189.4201;DEBUG SETTINGS ;3;293;353;291;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;295;1377.783,-1018.665;Inherit;False;169;122;GLOBAL SETTINGS ;1;294;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;475;1370.9,-265.4641;Inherit;False;324;112.5;DESF Common ASE Compile Shaders;1;476;;0,0.2605708,1,1;0;0
Node;AmplifyShaderEditor.WireNode;478;729.3715,-596.46;Inherit;False;1;0;FLOAT4;0,0,0,0;False;1;FLOAT4;0
Node;AmplifyShaderEditor.FunctionNode;473;731.9362,-685.198;Inherit;False;DESF Module Detail;66;;39591;49c077198be2bdb409ab6ad879c0ca28;4,200,1,201,1,347,0,346,0;2;39;FLOAT4;0,0,0,0;False;38;FLOAT3;0,0,1;False;2;FLOAT4;73;FLOAT3;72
Node;AmplifyShaderEditor.IntNode;291;1385.189,-845.5454;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;353;1389.431,-774.1531;Inherit;False;Constant;_MaskClipValue1;Mask Clip Value;14;0;Create;True;1;;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;294;1395.596,-980.853;Inherit;False;Property;_CullMode;Cull Mode;2;2;[Header];[Enum];Create;True;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;2;False;0;1;INT;0
Node;AmplifyShaderEditor.FunctionNode;476;1382.9,-225.4641;Inherit;False;DESF Common ASE Compile Shaders;-1;;39598;b85b01c42ba8a8a448b731b68fc0dbd9;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;293;1567.695,-844.718;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;1;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.FunctionNode;480;979.9363,-685.1976;Inherit;False;DESF Module Rain;93;;39599;58c64a46e00b7044aaf191f7451a976c;1,1532,1;3;746;FLOAT4;0,0,0,0;False;19;FLOAT3;0,0,1;False;23;FLOAT4;1,0,0,0;False;3;FLOAT4;747;FLOAT3;0;FLOAT4;1536
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;194;1374.904,-680.6909;Float;False;True;-1;3;;200;0;Standard;DEC/Rain/Rain Surface Wind Detail;False;False;False;False;False;False;False;False;False;False;False;False;True;False;True;False;False;False;True;True;True;Back;0;True;293;3;False;292;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;True;-10;True;Opaque;;Geometry;All;18;all;True;True;True;True;0;True;291;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;2;15;10;25;False;0.5;True;0;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;200;;-1;-1;-1;-1;1;NatureRendererInstancing=True;False;0;0;True;294;-1;0;True;353;5;Pragma;multi_compile_instancing;False;;Custom;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;;Custom;Include;Nature Renderer.cginc;False;5d792e02fd6741e4cb63087f97979470;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom;0;0;False;0.1;False;-1;0;False;-1;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;477;309;472;2190
WireConnection;477;1262;472;2970
WireConnection;478;0;477;41
WireConnection;473;39;477;42
WireConnection;473;38;477;39
WireConnection;480;746;473;73
WireConnection;480;19;473;72
WireConnection;480;23;478;0
WireConnection;194;0;480;747
WireConnection;194;1;480;0
WireConnection;194;3;477;0
WireConnection;194;4;480;1536
WireConnection;194;5;477;43
WireConnection;194;11;477;313
ASEEND*/
//CHKSM=356CF406675C2F76F91968482006E37E2AA46DDB