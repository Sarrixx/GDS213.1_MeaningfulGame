// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Surface Triplanar/Triplanar Spherical"
{
	Properties
	{
		[Header(DEBUG SETTINGS)][Enum(Off,0,On,1)]_ZWriteMode("ZWrite Mode", Int) = 1
		[Enum(None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15)]_ColorMask("Color Mask Mode", Int) = 15
		[Header(GLOBAL SETTINGS)][Enum(UnityEngine.Rendering.CullMode)]_CullMode("Cull Mode", Int) = 0
		[Header(BLEND)][Enum(World Space,0,Object Space,1)]_Blend_Space("UV Space", Int) = 1
		_Blend_CoverageAmount("Coverage Amount", Range( -1 , 1)) = 0
		_Blend_CoverageFalloff("Coverage Falloff", Range( 0.01 , 2)) = 0.5
		_Blend_CoverageFactor("Coverage Factor", Range( -1 , 1)) = 1
		[Header(TOP)]_Top_Color("Albedo Tint", Color) = (1,1,1,0)
		[SingleLineTexture]_Top_MainTex("Albedo Map", 2D) = "white" {}
		_Top_Brightness("Brightness", Range( 0 , 2)) = 1
		_Top_TilingX("Tiling X", Float) = 1
		_Top_TilingY("Tiling Y", Float) = 1
		_Top_OffsetX("Offset X", Float) = 0
		_Top_OffsetY("Offset Y", Float) = 0
		[Normal][SingleLineTexture]_Top_BumpMap("Normal Map", 2D) = "bump" {}
		_Top_NormalStrength("Normal Strength", Float) = 1
		[SingleLineTexture]_Top_MetallicMap("Metallic Map", 2D) = "white" {}
		_Top_MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
		[SingleLineTexture]_Top_OcclusionMap("Occlusion Map", 2D) = "white" {}
		[Enum(Texture,0,Baked,1)]_Top_OcclusionSourceMode("Occlusion Source Mode", Int) = 0
		_Top_OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0.5
		[SingleLineTexture]_Top_SmoothnessMap("Smoothness Map", 2D) = "white" {}
		[Enum(Standard,0,Geometric,1,Texture,2)]_Top_SmoothnessMode("Smoothness Mode", Int) = 2
		[Enum(Smoothness,0,Roughness,1)]_Top_SmoothnessType("Smoothness Type", Int) = 0
		_Top_SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0.1
		_Top_SmoothnessThreshold("Smoothness Threshold", Range( 0 , 0.5)) = 0
		_Top_SmoothnessVariance("Smoothness Variance", Range( 0 , 1)) = 0.2
		[Header(BOTTOM)]_Bottom_Color("Albedo Tint", Color) = (1,1,1,0)
		[SingleLineTexture]_Bottom_MainTex("Albedo Map", 2D) = "white" {}
		_Bottom_Brightness("Brightness", Range( 0 , 2)) = 1
		_Bottom_TilingX("Tiling X", Float) = 1
		_Bottom_TilingY("Tiling Y", Float) = 1
		_Bottom_OffsetX("Offset X", Float) = 0
		_Bottom_OffsetY("Offset Y", Float) = 0
		[Normal][SingleLineTexture]_Bottom_BumpMap("Normal Map", 2D) = "bump" {}
		_Bottom_NormalStrength("Normal Strength", Float) = 1
		[SingleLineTexture]_Bottom_MetallicMap("Metallic Map", 2D) = "white" {}
		_Bottom_MetallicStrength("Metallic Strength", Range( 0 , 1)) = 0
		[SingleLineTexture]_Bottom_OcclusionMap("Occlusion Map", 2D) = "white" {}
		[Enum(Texture,0,Baked,1)]_Bottom_OcclusionSourceMode("Occlusion Source Mode", Int) = 0
		_Bottom_OcclusionStrengthAO("Occlusion Strength", Range( 0 , 1)) = 0.5
		[SingleLineTexture]_Bottom_SmoothnessMap("Smoothness Map", 2D) = "white" {}
		[Enum(Standard,0,Geometric,1,Texture,2)]_Bottom_SmoothnessMode("Smoothness Mode", Int) = 2
		[Enum(Smoothness,0,Roughness,1)]_Bottom_SmoothnessType("Smoothness Type", Int) = 0
		_Bottom_SmoothnessStrength("Smoothness Strength", Range( 0 , 1)) = 0.1
		_Bottom_SmoothnessThreshold("Smoothness Threshold", Range( 0 , 0.5)) = 0
		_Bottom_SmoothnessVariance("Smoothness Variance", Range( 0 , 1)) = 0.2
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
			float3 worldPos;
			float3 worldNormal;
			INTERNAL_DATA
			float4 vertexColor : COLOR;
		};

		uniform int _ColorMask;
		uniform int _CullMode;
		uniform int _ZWriteMode;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Bottom_BumpMap);
		uniform int _Blend_Space;
		uniform float _Bottom_TilingX;
		uniform float _Bottom_TilingY;
		uniform float _Bottom_OffsetX;
		uniform float _Bottom_OffsetY;
		SamplerState sampler_trilinear_repeat;
		uniform half _Bottom_NormalStrength;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Top_BumpMap);
		uniform float _Top_TilingX;
		uniform float _Top_TilingY;
		uniform float _Top_OffsetX;
		uniform float _Top_OffsetY;
		uniform half _Top_NormalStrength;
		uniform float _Blend_CoverageAmount;
		uniform float _Blend_CoverageFactor;
		uniform float _Blend_CoverageFalloff;
		uniform float4 _Bottom_Color;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Bottom_MainTex);
		uniform half _Bottom_Brightness;
		uniform float4 _Top_Color;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Top_MainTex);
		uniform half _Top_Brightness;
		uniform float _Bottom_MetallicStrength;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Bottom_MetallicMap);
		uniform float _Top_MetallicStrength;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Top_MetallicMap);
		uniform int _Bottom_SmoothnessMode;
		uniform int _Bottom_SmoothnessType;
		uniform float _Bottom_SmoothnessStrength;
		uniform float _Bottom_SmoothnessVariance;
		uniform float _Bottom_SmoothnessThreshold;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Bottom_SmoothnessMap);
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Bottom_OcclusionMap);
		uniform int _Bottom_OcclusionSourceMode;
		uniform float _Bottom_OcclusionStrengthAO;
		uniform int _Top_SmoothnessMode;
		uniform int _Top_SmoothnessType;
		uniform float _Top_SmoothnessStrength;
		uniform float _Top_SmoothnessVariance;
		uniform float _Top_SmoothnessThreshold;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Top_SmoothnessMap);
		UNITY_DECLARE_TEX2D_NOSAMPLER(_Top_OcclusionMap);
		uniform int _Top_OcclusionSourceMode;
		uniform float _Top_OcclusionStrengthAO;


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


		float3 float3switch3_g39689( int m_switch, float3 m_WorldSpace, float3 m_ObjectSpace )
		{
			if(m_switch ==0)
				return m_WorldSpace;
			else if(m_switch ==1)
				return m_ObjectSpace;
			else
			return float3(0,0,0);
		}


		float3 float3switch3_g39686( int m_switch, float3 m_WorldSpace, float3 m_ObjectSpace )
		{
			if(m_switch ==0)
				return m_WorldSpace;
			else if(m_switch ==1)
				return m_ObjectSpace;
			else
			return float3(0,0,0);
		}


		float3 float3switch3_g39697( int m_switch, float3 m_WorldSpace, float3 m_ObjectSpace )
		{
			if(m_switch ==0)
				return m_WorldSpace;
			else if(m_switch ==1)
				return m_ObjectSpace;
			else
			return float3(0,0,0);
		}


		float3 float3switch3_g39694( int m_switch, float3 m_WorldSpace, float3 m_ObjectSpace )
		{
			if(m_switch ==0)
				return m_WorldSpace;
			else if(m_switch ==1)
				return m_ObjectSpace;
			else
			return float3(0,0,0);
		}


		float3 float3switch3_g39702( int m_switch, float3 m_WorldSpace, float3 m_ObjectSpace )
		{
			if(m_switch ==0)
				return m_WorldSpace;
			else if(m_switch ==1)
				return m_ObjectSpace;
			else
			return float3(0,0,0);
		}


		float3 float3switch3_g39718( int m_switch, float3 m_WorldSpace, float3 m_ObjectSpace )
		{
			if(m_switch ==0)
				return m_WorldSpace;
			else if(m_switch ==1)
				return m_ObjectSpace;
			else
			return float3(0,0,0);
		}


		float4 float4switch455_g39140( int m_switch, float4 m_Smoothness, float4 m_Roughness )
		{
			if(m_switch ==0)
				return m_Smoothness;
			else if(m_switch ==1)
				return m_Roughness;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch454_g39140( int m_switch, float4 m_Smoothness, float4 m_Roughness )
		{
			if(m_switch ==0)
				return m_Smoothness;
			else if(m_switch ==1)
				return m_Roughness;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch461_g39140( int m_switch, float4 m_Standard, float4 m_Geometric, float4 m_Texture )
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


		float4 float4switch407_g39140( int m_switch, float4 m_Smoothness, float4 m_Roughness )
		{
			if(m_switch ==0)
				return m_Smoothness;
			else if(m_switch ==1)
				return m_Roughness;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch432_g39140( int m_switch, float4 m_Smoothness, float4 m_Roughness )
		{
			if(m_switch ==0)
				return m_Smoothness;
			else if(m_switch ==1)
				return m_Roughness;
			else
			return float4(0,0,0,0);
		}


		float4 float4switch421_g39140( int m_switch, float4 m_Standard, float4 m_Geometric, float4 m_Texture )
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


		void surf( Input i , inout SurfaceOutputStandard o )
		{
			int _UV_SPACE2529_g39140 = _Blend_Space;
			int temp_output_62_0_g39684 = _UV_SPACE2529_g39140;
			int m_switch3_g39689 = temp_output_62_0_g39684;
			float3 ase_worldPos = i.worldPos;
			float3 m_WorldSpace3_g39689 = ase_worldPos;
			float3 ase_vertex3Pos = mul( unity_WorldToObject, float4( i.worldPos , 1 ) );
			float3 m_ObjectSpace3_g39689 = ase_vertex3Pos;
			float3 localfloat3switch3_g39689 = float3switch3_g39689( m_switch3_g39689 , m_WorldSpace3_g39689 , m_ObjectSpace3_g39689 );
			float3 break10_g39684 = localfloat3switch3_g39689;
			float2 appendResult13_g39684 = (float2(break10_g39684.y , break10_g39684.z));
			float2 appendResult154_g39140 = (float2(_Bottom_TilingX , _Bottom_TilingY));
			float2 BOTTOM_Tilling563_g39140 = appendResult154_g39140;
			float2 temp_output_60_0_g39684 = BOTTOM_Tilling563_g39140;
			float2 appendResult153_g39140 = (float2(_Bottom_OffsetX , _Bottom_OffsetY));
			float2 BOTTOM_Offset561_g39140 = appendResult153_g39140;
			float2 temp_output_61_0_g39684 = BOTTOM_Offset561_g39140;
			float2 UV_0121_g39684 = ( ( appendResult13_g39684 * temp_output_60_0_g39684 ) + temp_output_61_0_g39684 );
			int m_switch3_g39686 = temp_output_62_0_g39684;
			float3 ase_worldNormal = WorldNormalVector( i, float3( 0, 0, 1 ) );
			float3 WORLD_NORMAL83_g39686 = ase_worldNormal;
			float3 m_WorldSpace3_g39686 = WORLD_NORMAL83_g39686;
			float3 m_ObjectSpace3_g39686 = mul( unity_WorldToObject, float4( WORLD_NORMAL83_g39686 , 0.0 ) ).xyz;
			float3 localfloat3switch3_g39686 = float3switch3_g39686( m_switch3_g39686 , m_WorldSpace3_g39686 , m_ObjectSpace3_g39686 );
			float3 temp_output_33_0_g39684 = abs( localfloat3switch3_g39686 );
			float dotResult30_g39684 = dot( temp_output_33_0_g39684 , float3(1,1,1) );
			float3 BLEND36_g39684 = ( temp_output_33_0_g39684 / dotResult30_g39684 );
			float3 break109_g39684 = BLEND36_g39684;
			float2 appendResult15_g39684 = (float2(break10_g39684.x , break10_g39684.z));
			float2 UV_0220_g39684 = ( ( appendResult15_g39684 * temp_output_60_0_g39684 ) + temp_output_61_0_g39684 );
			float2 appendResult25_g39684 = (float2(break10_g39684.x , break10_g39684.y));
			float2 UV_0327_g39684 = ( ( appendResult25_g39684 * temp_output_60_0_g39684 ) + temp_output_61_0_g39684 );
			float4 temp_output_2592_71_g39140 = ( ( ( SAMPLE_TEXTURE2D( _Bottom_BumpMap, sampler_trilinear_repeat, UV_0121_g39684 ) * break109_g39684.x ) + ( SAMPLE_TEXTURE2D( _Bottom_BumpMap, sampler_trilinear_repeat, UV_0220_g39684 ) * break109_g39684.y ) ) + ( SAMPLE_TEXTURE2D( _Bottom_BumpMap, sampler_trilinear_repeat, UV_0327_g39684 ) * break109_g39684.z ) );
			float4 BOTTOM_FINAL_NORMAL614_g39140 = temp_output_2592_71_g39140;
			float4 temp_output_1_0_g39672 = BOTTOM_FINAL_NORMAL614_g39140;
			float temp_output_8_0_g39672 = _Bottom_NormalStrength;
			int temp_output_62_0_g39692 = _UV_SPACE2529_g39140;
			int m_switch3_g39697 = temp_output_62_0_g39692;
			float3 m_WorldSpace3_g39697 = ase_worldPos;
			float3 m_ObjectSpace3_g39697 = ase_vertex3Pos;
			float3 localfloat3switch3_g39697 = float3switch3_g39697( m_switch3_g39697 , m_WorldSpace3_g39697 , m_ObjectSpace3_g39697 );
			float3 break10_g39692 = localfloat3switch3_g39697;
			float2 appendResult13_g39692 = (float2(break10_g39692.y , break10_g39692.z));
			float2 appendResult897_g39140 = (float2(_Top_TilingX , _Top_TilingY));
			float2 TOP_Tilling892_g39140 = appendResult897_g39140;
			float2 temp_output_60_0_g39692 = TOP_Tilling892_g39140;
			float2 appendResult896_g39140 = (float2(_Top_OffsetX , _Top_OffsetY));
			float2 TOP_Offset869_g39140 = appendResult896_g39140;
			float2 temp_output_61_0_g39692 = TOP_Offset869_g39140;
			float2 UV_0121_g39692 = ( ( appendResult13_g39692 * temp_output_60_0_g39692 ) + temp_output_61_0_g39692 );
			int m_switch3_g39694 = temp_output_62_0_g39692;
			float3 WORLD_NORMAL83_g39694 = ase_worldNormal;
			float3 m_WorldSpace3_g39694 = WORLD_NORMAL83_g39694;
			float3 m_ObjectSpace3_g39694 = mul( unity_WorldToObject, float4( WORLD_NORMAL83_g39694 , 0.0 ) ).xyz;
			float3 localfloat3switch3_g39694 = float3switch3_g39694( m_switch3_g39694 , m_WorldSpace3_g39694 , m_ObjectSpace3_g39694 );
			float3 temp_output_33_0_g39692 = abs( localfloat3switch3_g39694 );
			float dotResult30_g39692 = dot( temp_output_33_0_g39692 , float3(1,1,1) );
			float3 BLEND36_g39692 = ( temp_output_33_0_g39692 / dotResult30_g39692 );
			float3 break109_g39692 = BLEND36_g39692;
			float2 appendResult15_g39692 = (float2(break10_g39692.x , break10_g39692.z));
			float2 UV_0220_g39692 = ( ( appendResult15_g39692 * temp_output_60_0_g39692 ) + temp_output_61_0_g39692 );
			float2 appendResult25_g39692 = (float2(break10_g39692.x , break10_g39692.y));
			float2 UV_0327_g39692 = ( ( appendResult25_g39692 * temp_output_60_0_g39692 ) + temp_output_61_0_g39692 );
			float4 temp_output_2524_71_g39140 = ( ( ( SAMPLE_TEXTURE2D( _Top_BumpMap, sampler_trilinear_repeat, UV_0121_g39692 ) * break109_g39692.x ) + ( SAMPLE_TEXTURE2D( _Top_BumpMap, sampler_trilinear_repeat, UV_0220_g39692 ) * break109_g39692.y ) ) + ( SAMPLE_TEXTURE2D( _Top_BumpMap, sampler_trilinear_repeat, UV_0327_g39692 ) * break109_g39692.z ) );
			float4 TOP_FINAL_NORMAL641_g39140 = temp_output_2524_71_g39140;
			float4 temp_output_1_0_g39670 = TOP_FINAL_NORMAL641_g39140;
			float temp_output_8_0_g39670 = _Top_NormalStrength;
			int m_switch3_g39702 = _Blend_Space;
			float3 WORLD_NORMAL83_g39702 = ase_worldNormal;
			float3 m_WorldSpace3_g39702 = WORLD_NORMAL83_g39702;
			float3 m_ObjectSpace3_g39702 = mul( unity_WorldToObject, float4( WORLD_NORMAL83_g39702 , 0.0 ) ).xyz;
			float3 localfloat3switch3_g39702 = float3switch3_g39702( m_switch3_g39702 , m_WorldSpace3_g39702 , m_ObjectSpace3_g39702 );
			float3 temp_output_2520_0_g39140 = localfloat3switch3_g39702;
			float temp_output_180_0_g39140 = ( 1.0 + _Blend_CoverageFactor );
			float _Coverage_Normal2553_g39140 = saturate( pow( saturate( ( temp_output_2520_0_g39140.y * _Blend_CoverageAmount * temp_output_180_0_g39140 ) ) , _Blend_CoverageFalloff ) );
			float3 lerpResult47_g39140 = lerp( UnpackScaleNormal( temp_output_1_0_g39672, temp_output_8_0_g39672 ) , UnpackScaleNormal( temp_output_1_0_g39670, temp_output_8_0_g39670 ) , _Coverage_Normal2553_g39140);
			o.Normal = lerpResult47_g39140;
			float3 break48_g39684 = BLEND36_g39684;
			float4 temp_output_59_0_g39684 = ( ( ( SAMPLE_TEXTURE2D( _Bottom_MainTex, sampler_trilinear_repeat, UV_0121_g39684 ) * break48_g39684.x ) + ( SAMPLE_TEXTURE2D( _Bottom_MainTex, sampler_trilinear_repeat, UV_0220_g39684 ) * break48_g39684.y ) ) + ( SAMPLE_TEXTURE2D( _Bottom_MainTex, sampler_trilinear_repeat, UV_0327_g39684 ) * break48_g39684.z ) );
			float4 temp_output_2592_78_g39140 = temp_output_59_0_g39684;
			float4 BOTTOM_FINAL_ALBEDO612_g39140 = temp_output_2592_78_g39140;
			float3 break48_g39692 = BLEND36_g39692;
			float4 temp_output_59_0_g39692 = ( ( ( SAMPLE_TEXTURE2D( _Top_MainTex, sampler_trilinear_repeat, UV_0121_g39692 ) * break48_g39692.x ) + ( SAMPLE_TEXTURE2D( _Top_MainTex, sampler_trilinear_repeat, UV_0220_g39692 ) * break48_g39692.y ) ) + ( SAMPLE_TEXTURE2D( _Top_MainTex, sampler_trilinear_repeat, UV_0327_g39692 ) * break48_g39692.z ) );
			float4 temp_output_2524_78_g39140 = temp_output_59_0_g39692;
			float4 TOP_FINAL_ALBEDO632_g39140 = temp_output_2524_78_g39140;
			int m_switch3_g39718 = _Blend_Space;
			float3 GLOBAL_NORMAL_OUT525_g39140 = lerpResult47_g39140;
			float3 WORLD_NORMAL83_g39718 = (WorldNormalVector( i , GLOBAL_NORMAL_OUT525_g39140 ));
			float3 m_WorldSpace3_g39718 = WORLD_NORMAL83_g39718;
			float3 m_ObjectSpace3_g39718 = mul( unity_WorldToObject, float4( WORLD_NORMAL83_g39718 , 0.0 ) ).xyz;
			float3 localfloat3switch3_g39718 = float3switch3_g39718( m_switch3_g39718 , m_WorldSpace3_g39718 , m_ObjectSpace3_g39718 );
			float _Coverage2552_g39140 = saturate( pow( saturate( ( localfloat3switch3_g39718.y * _Blend_CoverageAmount * temp_output_180_0_g39140 ) ) , _Blend_CoverageFalloff ) );
			float4 lerpResult1269_g39140 = lerp( ( float4( (_Bottom_Color).rgb , 0.0 ) * BOTTOM_FINAL_ALBEDO612_g39140 * _Bottom_Brightness ) , ( float4( (_Top_Color).rgb , 0.0 ) * TOP_FINAL_ALBEDO632_g39140 * _Top_Brightness ) , _Coverage2552_g39140);
			o.Albedo = lerpResult1269_g39140.rgb;
			float3 break169_g39684 = BLEND36_g39684;
			float4 temp_output_2592_70_g39140 = ( ( ( SAMPLE_TEXTURE2D( _Bottom_MetallicMap, sampler_trilinear_repeat, UV_0121_g39684 ) * break169_g39684.x ) + ( SAMPLE_TEXTURE2D( _Bottom_MetallicMap, sampler_trilinear_repeat, UV_0220_g39684 ) * break169_g39684.y ) ) + ( SAMPLE_TEXTURE2D( _Bottom_MetallicMap, sampler_trilinear_repeat, UV_0327_g39684 ) * break169_g39684.z ) );
			float4 BOTTOM_MASK_MAP_B357_g39140 = temp_output_2592_70_g39140;
			float4 BOTTOM_FINAL_METALLIC483_g39140 = ( _Bottom_MetallicStrength * BOTTOM_MASK_MAP_B357_g39140 );
			float3 break169_g39692 = BLEND36_g39692;
			float4 temp_output_2524_70_g39140 = ( ( ( SAMPLE_TEXTURE2D( _Top_MetallicMap, sampler_trilinear_repeat, UV_0121_g39692 ) * break169_g39692.x ) + ( SAMPLE_TEXTURE2D( _Top_MetallicMap, sampler_trilinear_repeat, UV_0220_g39692 ) * break169_g39692.y ) ) + ( SAMPLE_TEXTURE2D( _Top_MetallicMap, sampler_trilinear_repeat, UV_0327_g39692 ) * break169_g39692.z ) );
			float4 TOP_MASK_MAP_B372_g39140 = temp_output_2524_70_g39140;
			float4 TOP_FINAL_METALLIC482_g39140 = ( _Top_MetallicStrength * TOP_MASK_MAP_B372_g39140 );
			float4 lerpResult364_g39140 = lerp( BOTTOM_FINAL_METALLIC483_g39140 , TOP_FINAL_METALLIC482_g39140 , _Coverage2552_g39140);
			o.Metallic = lerpResult364_g39140.r;
			int m_switch461_g39140 = _Bottom_SmoothnessMode;
			int m_switch455_g39140 = _Bottom_SmoothnessType;
			float4 temp_cast_14 = (_Bottom_SmoothnessStrength).xxxx;
			float4 m_Smoothness455_g39140 = temp_cast_14;
			float4 temp_cast_15 = (( 1.0 - _Bottom_SmoothnessStrength )).xxxx;
			float4 m_Roughness455_g39140 = temp_cast_15;
			float4 localfloat4switch455_g39140 = float4switch455_g39140( m_switch455_g39140 , m_Smoothness455_g39140 , m_Roughness455_g39140 );
			float4 m_Standard461_g39140 = localfloat4switch455_g39140;
			float3 BOTTOM_FINAL_NORMAL_WORLD329_g39140 = (WorldNormalVector( i , UnpackScaleNormal( temp_output_1_0_g39672, temp_output_8_0_g39672 ) ));
			float3 temp_output_442_0_g39140 = ddx( BOTTOM_FINAL_NORMAL_WORLD329_g39140 );
			float dotResult447_g39140 = dot( temp_output_442_0_g39140 , temp_output_442_0_g39140 );
			float3 temp_output_445_0_g39140 = ddy( BOTTOM_FINAL_NORMAL_WORLD329_g39140 );
			float dotResult440_g39140 = dot( temp_output_445_0_g39140 , temp_output_445_0_g39140 );
			float temp_output_450_0_g39140 = sqrt( saturate( ( ( _Bottom_SmoothnessStrength * _Bottom_SmoothnessStrength ) + min( ( ( _Bottom_SmoothnessVariance * ( dotResult447_g39140 + dotResult440_g39140 ) ) * 2.0 ) , ( _Bottom_SmoothnessThreshold * _Bottom_SmoothnessThreshold ) ) ) ) );
			float BOTTOM_ALBEDO_R359_g39140 = temp_output_2592_78_g39140.r;
			float4 temp_cast_16 = (( temp_output_450_0_g39140 * ( 1.0 - BOTTOM_ALBEDO_R359_g39140 ) )).xxxx;
			float4 m_Geometric461_g39140 = temp_cast_16;
			int m_switch454_g39140 = _Bottom_SmoothnessType;
			float3 break154_g39684 = BLEND36_g39684;
			float4 temp_output_2592_72_g39140 = ( ( ( SAMPLE_TEXTURE2D( _Bottom_SmoothnessMap, sampler_trilinear_repeat, UV_0121_g39684 ) * break154_g39684.x ) + ( SAMPLE_TEXTURE2D( _Bottom_SmoothnessMap, sampler_trilinear_repeat, UV_0220_g39684 ) * break154_g39684.y ) ) + ( SAMPLE_TEXTURE2D( _Bottom_SmoothnessMap, sampler_trilinear_repeat, UV_0327_g39684 ) * break154_g39684.z ) );
			float4 BOTTOM_MASK_MAP_G358_g39140 = temp_output_2592_72_g39140;
			float4 m_Smoothness454_g39140 = BOTTOM_MASK_MAP_G358_g39140;
			float4 m_Roughness454_g39140 = ( 1.0 - BOTTOM_MASK_MAP_G358_g39140 );
			float4 localfloat4switch454_g39140 = float4switch454_g39140( m_switch454_g39140 , m_Smoothness454_g39140 , m_Roughness454_g39140 );
			float4 m_Texture461_g39140 = ( temp_output_450_0_g39140 * localfloat4switch454_g39140 );
			float4 localfloat4switch461_g39140 = float4switch461_g39140( m_switch461_g39140 , m_Standard461_g39140 , m_Geometric461_g39140 , m_Texture461_g39140 );
			float4 color462_g39140 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float3 break184_g39684 = BLEND36_g39684;
			float4 temp_output_2592_76_g39140 = ( ( ( SAMPLE_TEXTURE2D( _Bottom_OcclusionMap, sampler_trilinear_repeat, UV_0121_g39684 ) * break184_g39684.x ) + ( SAMPLE_TEXTURE2D( _Bottom_OcclusionMap, sampler_trilinear_repeat, UV_0220_g39684 ) * break184_g39684.y ) ) + ( SAMPLE_TEXTURE2D( _Bottom_OcclusionMap, sampler_trilinear_repeat, UV_0327_g39684 ) * break184_g39684.z ) );
			float4 BOTTOM_MASK_MAP_R354_g39140 = temp_output_2592_76_g39140;
			float GLOBAL_VERTEX_COLOR_A373_g39140 = i.vertexColor.a;
			float4 temp_cast_19 = (GLOBAL_VERTEX_COLOR_A373_g39140).xxxx;
			float4 lerpResult463_g39140 = lerp( BOTTOM_MASK_MAP_R354_g39140 , temp_cast_19 , (float)_Bottom_OcclusionSourceMode);
			float4 lerpResult466_g39140 = lerp( color462_g39140 , lerpResult463_g39140 , _Bottom_OcclusionStrengthAO);
			float4 BOTTOM_FINAL_SMOOTHNESS485_g39140 = ( localfloat4switch461_g39140 * lerpResult466_g39140 );
			int m_switch421_g39140 = _Top_SmoothnessMode;
			int m_switch407_g39140 = _Top_SmoothnessType;
			float4 temp_cast_22 = (_Top_SmoothnessStrength).xxxx;
			float4 m_Smoothness407_g39140 = temp_cast_22;
			float4 temp_cast_23 = (( 1.0 - _Top_SmoothnessStrength )).xxxx;
			float4 m_Roughness407_g39140 = temp_cast_23;
			float4 localfloat4switch407_g39140 = float4switch407_g39140( m_switch407_g39140 , m_Smoothness407_g39140 , m_Roughness407_g39140 );
			float4 m_Standard421_g39140 = localfloat4switch407_g39140;
			float3 TOP_FINAL_NORMAL_WORLD377_g39140 = (WorldNormalVector( i , UnpackScaleNormal( temp_output_1_0_g39670, temp_output_8_0_g39670 ) ));
			float3 temp_output_405_0_g39140 = ddx( TOP_FINAL_NORMAL_WORLD377_g39140 );
			float dotResult425_g39140 = dot( temp_output_405_0_g39140 , temp_output_405_0_g39140 );
			float3 temp_output_415_0_g39140 = ddy( TOP_FINAL_NORMAL_WORLD377_g39140 );
			float dotResult403_g39140 = dot( temp_output_415_0_g39140 , temp_output_415_0_g39140 );
			float temp_output_410_0_g39140 = sqrt( saturate( ( ( _Top_SmoothnessStrength * _Top_SmoothnessStrength ) + min( ( ( _Top_SmoothnessVariance * ( dotResult425_g39140 + dotResult403_g39140 ) ) * 2.0 ) , ( _Top_SmoothnessThreshold * _Top_SmoothnessThreshold ) ) ) ) );
			float TOP_ALBEDO_R2629_g39140 = temp_output_2524_78_g39140.r;
			float4 temp_cast_24 = (( temp_output_410_0_g39140 * ( 1.0 - TOP_ALBEDO_R2629_g39140 ) )).xxxx;
			float4 m_Geometric421_g39140 = temp_cast_24;
			int m_switch432_g39140 = _Top_SmoothnessType;
			float3 break154_g39692 = BLEND36_g39692;
			float4 temp_output_2524_72_g39140 = ( ( ( SAMPLE_TEXTURE2D( _Top_SmoothnessMap, sampler_trilinear_repeat, UV_0121_g39692 ) * break154_g39692.x ) + ( SAMPLE_TEXTURE2D( _Top_SmoothnessMap, sampler_trilinear_repeat, UV_0220_g39692 ) * break154_g39692.y ) ) + ( SAMPLE_TEXTURE2D( _Top_SmoothnessMap, sampler_trilinear_repeat, UV_0327_g39692 ) * break154_g39692.z ) );
			float4 TOP_MASK_MAP_G371_g39140 = temp_output_2524_72_g39140;
			float4 m_Smoothness432_g39140 = TOP_MASK_MAP_G371_g39140;
			float4 m_Roughness432_g39140 = ( 1.0 - TOP_MASK_MAP_G371_g39140 );
			float4 localfloat4switch432_g39140 = float4switch432_g39140( m_switch432_g39140 , m_Smoothness432_g39140 , m_Roughness432_g39140 );
			float4 m_Texture421_g39140 = ( temp_output_410_0_g39140 * localfloat4switch432_g39140 );
			float4 localfloat4switch421_g39140 = float4switch421_g39140( m_switch421_g39140 , m_Standard421_g39140 , m_Geometric421_g39140 , m_Texture421_g39140 );
			float4 color383_g39140 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float3 break184_g39692 = BLEND36_g39692;
			float4 temp_output_2524_76_g39140 = ( ( ( SAMPLE_TEXTURE2D( _Top_OcclusionMap, sampler_trilinear_repeat, UV_0121_g39692 ) * break184_g39692.x ) + ( SAMPLE_TEXTURE2D( _Top_OcclusionMap, sampler_trilinear_repeat, UV_0220_g39692 ) * break184_g39692.y ) ) + ( SAMPLE_TEXTURE2D( _Top_OcclusionMap, sampler_trilinear_repeat, UV_0327_g39692 ) * break184_g39692.z ) );
			float4 TOP_MASK_MAP_R370_g39140 = temp_output_2524_76_g39140;
			float4 temp_cast_27 = (GLOBAL_VERTEX_COLOR_A373_g39140).xxxx;
			float4 lerpResult384_g39140 = lerp( TOP_MASK_MAP_R370_g39140 , temp_cast_27 , (float)_Top_OcclusionSourceMode);
			float4 lerpResult386_g39140 = lerp( color383_g39140 , lerpResult384_g39140 , _Top_OcclusionStrengthAO);
			float4 TOP_FINAL_SMOOTHNESS484_g39140 = ( localfloat4switch421_g39140 * lerpResult386_g39140 );
			float4 lerpResult365_g39140 = lerp( BOTTOM_FINAL_SMOOTHNESS485_g39140 , TOP_FINAL_SMOOTHNESS484_g39140 , _Coverage2552_g39140);
			o.Smoothness = lerpResult365_g39140.x;
			float4 BOTTOM_FINAL_OCCLUSION487_g39140 = saturate( lerpResult466_g39140 );
			float4 TOP_FINAL_OCCLUSION486_g39140 = saturate( lerpResult386_g39140 );
			float4 lerpResult488_g39140 = lerp( BOTTOM_FINAL_OCCLUSION487_g39140 , TOP_FINAL_OCCLUSION486_g39140 , _Coverage2552_g39140);
			o.Occlusion = lerpResult488_g39140.r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=18913
486;116;1467;857;-609.278;931.2369;1.000157;True;False
Node;AmplifyShaderEditor.CommentaryNode;290;1377.96,-881.2607;Inherit;False;355.4987;189.4197;DEBUG SETTINGS ;3;293;353;291;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;295;1379.783,-1005.666;Inherit;False;170.9667;113.002;GLOBAL SETTINGS ;1;294;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;464;1380.689,-260.329;Inherit;False;329.9845;123.4943;DESF Common ASE Compile Shaders;1;465;;0,0.2605708,1,1;0;0
Node;AmplifyShaderEditor.IntNode;291;1387.189,-839.5454;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;353;1391.431,-768.1531;Inherit;False;Constant;_MaskClipValue1;Mask Clip Value;14;0;Create;True;1;;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;294;1394.596,-970.8541;Inherit;False;Property;_CullMode;Cull Mode;2;2;[Header];[Enum];Create;True;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;2;False;0;1;INT;0
Node;AmplifyShaderEditor.FunctionNode;465;1396.685,-219.331;Inherit;False;DESF Common ASE Compile Shaders;-1;;39139;b85b01c42ba8a8a448b731b68fc0dbd9;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;466;1037.819,-685.7231;Inherit;False;DESF Core Surface Triplanar;3;;39140;790fb642c24decb4ebda2614061db534;49,1803,0,1809,0,1807,0,1808,0,1806,0,2443,0,513,0,524,0,518,1,2056,1,2578,1,2614,1,2702,0,2055,1,2572,1,2609,1,2583,1,2603,1,2057,1,2573,0,2543,0,2549,0,2547,0,1418,0,2615,0,2584,0,1416,0,2604,0,2585,0,1417,0,2616,0,2545,0,2610,0,2574,0,2586,0,2611,0,2579,0,2580,0,2617,0,2605,0,2518,0,2511,0,2514,0,2516,0,2515,0,2513,0,2517,0,2512,0,2510,0;0;7;COLOR;0;FLOAT3;122;FLOAT3;2689;COLOR;489;FLOAT4;351;COLOR;352;FLOAT3;2446
Node;AmplifyShaderEditor.IntNode;293;1574.693,-836.7177;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;1;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;194;1374.904,-680.6909;Float;False;True;-1;6;;200;0;Standard;DEC/Surface Triplanar/Triplanar Spherical;False;False;False;False;False;False;False;False;False;False;False;False;True;False;True;False;False;False;True;True;True;Back;0;True;293;3;False;292;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;True;-10;True;Opaque;;Geometry;All;18;all;True;True;True;True;0;True;291;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;0;1;0;5;False;0.5;True;0;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;200;;-1;-1;-1;-1;1;NatureRendererInstancing=True;False;0;0;True;294;-1;0;True;353;5;Pragma;multi_compile_instancing;False;;Custom;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;;Custom;Include;Nature Renderer.cginc;False;5d792e02fd6741e4cb63087f97979470;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom;0;0;False;0.1;False;-1;0;False;-1;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;194;0;466;0
WireConnection;194;1;466;122
WireConnection;194;3;466;489
WireConnection;194;4;466;351
WireConnection;194;5;466;352
ASEEND*/
//CHKSM=F5415A35D23BE2D87B4859A315FB04E5AAFC51BC