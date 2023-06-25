// Made with Amplify Shader Editor
// Available at the Unity Asset Store - http://u3d.as/y3X 
Shader "DEC/Surface/Surface Detail"
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
		[HideInInspector] _texcoord( "", 2D ) = "white" {}
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
			float4 vertexColor : COLOR;
		};

		uniform int _ColorMask;
		uniform int _CullMode;
		uniform int _ZWriteMode;
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
		uniform half4 _ColorDetail;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_DetailAlbedoMap);
		uniform float _MetallicStrength;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_MetallicGlossMap);
		uniform int _SmoothnessModeSurface;
		uniform int _SmoothnessType;
		uniform float _SmoothnessStrength;
		uniform float _SmoothnessVariance;
		uniform float _SmoothnessThreshold;
		UNITY_DECLARE_TEX2D_NOSAMPLER(_SmoothnessMap);
		UNITY_DECLARE_TEX2D_NOSAMPLER(_OcclusionMap);
		uniform int _OcclusionSourceMode;
		uniform float _OcclusionStrengthAO;


		float3 float3switch221_g39592( int m_switch, float3 m_Off, float3 m_Active, float3 m_ActiveInverted )
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


		float floatswitch319_g39592( int m_switch, float m_Red, float m_Green, float m_Blue )
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


		float3 float3switch127_g39592( int m_switch, float3 m_Off, float3 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float3(0,0,0);
		}


		float4 float4switch226_g39592( int m_switch, float4 m_Off, float4 m_Active, float4 m_ActiveInverted )
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


		float4 float4switch125_g39592( int m_switch, float4 m_Off, float4 m_Active )
		{
			if(m_switch ==0)
				return m_Off;
			else if(m_switch ==1)
				return m_Active;
			else
			return float4(0,0,0,0);
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


		void surf( Input i , inout SurfaceOutputStandard o )
		{
			int SURFACE_MAP_MODE122_g39592 = _EnableDetailMap;
			int m_switch127_g39592 = SURFACE_MAP_MODE122_g39592;
			float2 appendResult150_g38532 = (float2(_TilingX , _TilingY));
			float2 appendResult151_g38532 = (float2(_OffsetX , _OffsetY));
			float2 uv_TexCoord2_g39586 = i.uv_texcoord * appendResult150_g38532 + appendResult151_g38532;
			float2 appendResult6_g39586 = (float2(uv_TexCoord2_g39586.x , uv_TexCoord2_g39586.y));
			float2 OUT_UV431_g38532 = appendResult6_g39586;
			float2 UV40_g39580 = OUT_UV431_g38532;
			float4 OUT_NORMAL1178_g38532 = SAMPLE_TEXTURE2D( _BumpMap, sampler_trilinear_repeat, UV40_g39580 );
			float4 temp_output_1_0_g39549 = OUT_NORMAL1178_g38532;
			float temp_output_8_0_g39549 = _NormalStrength;
			float3 temp_output_1478_59_g38532 = UnpackScaleNormal( temp_output_1_0_g39549, temp_output_8_0_g39549 );
			float3 temp_output_38_0_g39592 = temp_output_1478_59_g38532;
			float3 NORMAL_IN260_g39592 = temp_output_38_0_g39592;
			float3 m_Off127_g39592 = NORMAL_IN260_g39592;
			int EnableDetailMask216_g39592 = _EnableDetailMask;
			int m_switch221_g39592 = EnableDetailMask216_g39592;
			float2 appendResult132_g39592 = (float2(_DetailTilingXDetail , _DetailTilingYDetail));
			float2 appendResult114_g39592 = (float2(_DetailOffsetXDetail , _DetailOffsetYDetail));
			float2 uv_TexCoord67_g39592 = i.uv_texcoord * appendResult132_g39592 + appendResult114_g39592;
			float4 temp_output_1_0_g39597 = SAMPLE_TEXTURE2D( _DetailNormalMap, sampler_trilinear_repeat, uv_TexCoord67_g39592 );
			float temp_output_8_0_g39597 = _DetailNormalMapScale;
			float3 NORMAL_OUT199_g39592 = UnpackScaleNormal( temp_output_1_0_g39597, temp_output_8_0_g39597 );
			float3 m_Off221_g39592 = NORMAL_OUT199_g39592;
			float2 appendResult219_g39592 = (float2(_DetailTilingXDetailMask , _DetailTilingYDetailMask));
			float2 appendResult206_g39592 = (float2(_DetailOffsetXDetailMask , _DetailOffsetYDetailMask));
			float2 uv_TexCoord220_g39592 = i.uv_texcoord * appendResult219_g39592 + appendResult206_g39592;
			float temp_output_15_0_g39596 = ( 1.0 - SAMPLE_TEXTURE2D( _DetailMaskMap, sampler_trilinear_repeat, uv_TexCoord220_g39592 ).r );
			float temp_output_26_0_g39596 = _Detail_BlendAmountMask;
			float temp_output_24_0_g39596 = _Detail_BlendHardnessMask;
			float saferPower2_g39596 = max( max( saturate( (0.0 + (temp_output_15_0_g39596 - ( 1.0 - temp_output_26_0_g39596 )) * (temp_output_24_0_g39596 - 0.0) / (1.0 - ( 1.0 - temp_output_26_0_g39596 ))) ) , 0.0 ) , 0.0001 );
			float temp_output_22_0_g39596 = _Detail_BlendFalloffMask;
			float temp_output_403_0_g39592 = saturate( pow( saferPower2_g39596 , ( 1.0 - temp_output_22_0_g39596 ) ) );
			float3 lerpResult205_g39592 = lerp( NORMAL_IN260_g39592 , NORMAL_OUT199_g39592 , temp_output_403_0_g39592);
			float3 m_Active221_g39592 = saturate( lerpResult205_g39592 );
			float saferPower11_g39596 = max( max( saturate( (1.0 + (temp_output_15_0_g39596 - temp_output_26_0_g39596) * (( 1.0 - temp_output_24_0_g39596 ) - 1.0) / (0.0 - temp_output_26_0_g39596)) ) , 0.0 ) , 0.0001 );
			float temp_output_403_21_g39592 = saturate( pow( saferPower11_g39596 , temp_output_22_0_g39596 ) );
			float3 lerpResult406_g39592 = lerp( NORMAL_OUT199_g39592 , NORMAL_IN260_g39592 , temp_output_403_21_g39592);
			float3 m_ActiveInverted221_g39592 = saturate( lerpResult406_g39592 );
			float3 localfloat3switch221_g39592 = float3switch221_g39592( m_switch221_g39592 , m_Off221_g39592 , m_Active221_g39592 , m_ActiveInverted221_g39592 );
			float3 MASK_NORMAL_OUT222_g39592 = localfloat3switch221_g39592;
			float4 tex2DNode63_g39580 = SAMPLE_TEXTURE2D( _MainTex, sampler_trilinear_repeat, UV40_g39580 );
			float4 OUT_ALBEDO_RGBA1177_g38532 = tex2DNode63_g39580;
			float3 temp_output_7_0_g38532 = ( (_Color).rgb * (OUT_ALBEDO_RGBA1177_g38532).rgb * _Brightness );
			float4 temp_output_39_0_g39592 = ( float4( temp_output_7_0_g38532 , 0.0 ) + float4(0,0,0,0) );
			float4 break48_g39592 = temp_output_39_0_g39592;
			float ALBEDO_IN_RGB300_g39592 = ( break48_g39592.x + break48_g39592.y + break48_g39592.z );
			int m_switch319_g39592 = _BlendColor;
			float m_Red319_g39592 = i.vertexColor.r;
			float m_Green319_g39592 = i.vertexColor.g;
			float m_Blue319_g39592 = i.vertexColor.b;
			float localfloatswitch319_g39592 = floatswitch319_g39592( m_switch319_g39592 , m_Red319_g39592 , m_Green319_g39592 , m_Blue319_g39592 );
			float clampResult47_g39592 = clamp( ( ( ( ( ALBEDO_IN_RGB300_g39592 - 0.5 ) * ( _DetailBlendInfluence - 0.9 ) ) + ( localfloatswitch319_g39592 - ( _BlendHeight - 0.4 ) ) ) / _DetailBlendSmooth ) , 0.0 , 1.0 );
			float DETAIL_BLEND43_g39592 = clampResult47_g39592;
			float3 lerpResult62_g39592 = lerp( MASK_NORMAL_OUT222_g39592 , NORMAL_IN260_g39592 , DETAIL_BLEND43_g39592);
			float3 temp_output_318_0_g39592 = ( NORMAL_IN260_g39592 + saturate( lerpResult62_g39592 ) );
			float3 m_Active127_g39592 = temp_output_318_0_g39592;
			float3 localfloat3switch127_g39592 = float3switch127_g39592( m_switch127_g39592 , m_Off127_g39592 , m_Active127_g39592 );
			o.Normal = localfloat3switch127_g39592;
			int m_switch125_g39592 = SURFACE_MAP_MODE122_g39592;
			float4 ALBEDO_IN_RGBA40_g39592 = temp_output_39_0_g39592;
			float4 m_Off125_g39592 = ALBEDO_IN_RGBA40_g39592;
			int m_switch226_g39592 = _EnableDetailMask;
			float4 tex2DNode45_g39592 = SAMPLE_TEXTURE2D( _DetailAlbedoMap, sampler_trilinear_repeat, uv_TexCoord67_g39592 );
			float4 ALBEDO_OUT255_g39592 = ( _ColorDetail * tex2DNode45_g39592 * _Brightness );
			float4 m_Off226_g39592 = ALBEDO_OUT255_g39592;
			float4 lerpResult225_g39592 = lerp( ALBEDO_IN_RGBA40_g39592 , ALBEDO_OUT255_g39592 , temp_output_403_0_g39592);
			float4 m_Active226_g39592 = lerpResult225_g39592;
			float4 lerpResult408_g39592 = lerp( ALBEDO_OUT255_g39592 , ALBEDO_IN_RGBA40_g39592 , temp_output_403_21_g39592);
			float4 m_ActiveInverted226_g39592 = lerpResult408_g39592;
			float4 localfloat4switch226_g39592 = float4switch226_g39592( m_switch226_g39592 , m_Off226_g39592 , m_Active226_g39592 , m_ActiveInverted226_g39592 );
			float4 MASK_ALBEDO_OUT258_g39592 = localfloat4switch226_g39592;
			float4 lerpResult58_g39592 = lerp( MASK_ALBEDO_OUT258_g39592 , ALBEDO_IN_RGBA40_g39592 , DETAIL_BLEND43_g39592);
			float4 m_Active125_g39592 = lerpResult58_g39592;
			float4 localfloat4switch125_g39592 = float4switch125_g39592( m_switch125_g39592 , m_Off125_g39592 , m_Active125_g39592 );
			o.Albedo = localfloat4switch125_g39592.xyz;
			float4 _MASK_B1440_g38532 = SAMPLE_TEXTURE2D( _MetallicGlossMap, sampler_trilinear_repeat, UV40_g39580 );
			o.Metallic = ( _MetallicStrength * _MASK_B1440_g38532 ).r;
			int m_switch99_g39551 = _SmoothnessModeSurface;
			int m_switch170_g39551 = _SmoothnessType;
			float4 temp_cast_9 = (_SmoothnessStrength).xxxx;
			float4 m_Smoothness170_g39551 = temp_cast_9;
			float4 temp_cast_10 = (( 1.0 - _SmoothnessStrength )).xxxx;
			float4 m_Roughness170_g39551 = temp_cast_10;
			float4 localfloat4switch170_g39551 = float4switch170_g39551( m_switch170_g39551 , m_Smoothness170_g39551 , m_Roughness170_g39551 );
			float4 FINAL_STANDARD111_g39551 = localfloat4switch170_g39551;
			float4 m_Standard99_g39551 = FINAL_STANDARD111_g39551;
			float3 NORMAL_WORLD_OUT164_g38532 = temp_output_1478_59_g38532;
			float3 temp_output_4_0_g39551 = NORMAL_WORLD_OUT164_g38532;
			float3 temp_output_23_0_g39551 = ddx( temp_output_4_0_g39551 );
			float dotResult25_g39551 = dot( temp_output_23_0_g39551 , temp_output_23_0_g39551 );
			float3 temp_output_7_0_g39551 = ddy( temp_output_4_0_g39551 );
			float dotResult27_g39551 = dot( temp_output_7_0_g39551 , temp_output_7_0_g39551 );
			float temp_output_28_0_g39551 = sqrt( saturate( ( ( _SmoothnessStrength * _SmoothnessStrength ) + min( ( ( _SmoothnessVariance * ( dotResult25_g39551 + dotResult27_g39551 ) ) * 2.0 ) , ( _SmoothnessThreshold * _SmoothnessThreshold ) ) ) ) );
			float4 break377_g38532 = OUT_ALBEDO_RGBA1177_g38532;
			float ALBEDO_R169_g38532 = break377_g38532.r;
			float4 temp_cast_11 = (ALBEDO_R169_g38532).xxxx;
			float4 FINAL_GEOMETRIC114_g39551 = ( temp_output_28_0_g39551 * ( 1.0 - temp_cast_11 ) );
			float4 m_Geometric99_g39551 = FINAL_GEOMETRIC114_g39551;
			int SMOOTHNESS_TYPE173_g39551 = _SmoothnessType;
			int m_switch167_g39551 = SMOOTHNESS_TYPE173_g39551;
			float4 _MASK_G1438_g38532 = SAMPLE_TEXTURE2D( _SmoothnessMap, sampler_trilinear_repeat, UV40_g39580 );
			float4 temp_output_83_0_g39551 = _MASK_G1438_g38532;
			float4 m_Smoothness167_g39551 = temp_output_83_0_g39551;
			float4 m_Roughness167_g39551 = ( 1.0 - temp_output_83_0_g39551 );
			float4 localfloat4switch167_g39551 = float4switch167_g39551( m_switch167_g39551 , m_Smoothness167_g39551 , m_Roughness167_g39551 );
			float4 FINAL_SMOOTHNESS_TEXTURE117_g39551 = ( temp_output_28_0_g39551 * localfloat4switch167_g39551 );
			float4 m_Texture99_g39551 = FINAL_SMOOTHNESS_TEXTURE117_g39551;
			float4 localfloat4switch99_g39551 = float4switch99_g39551( m_switch99_g39551 , m_Standard99_g39551 , m_Geometric99_g39551 , m_Texture99_g39551 );
			float4 temp_output_1267_33_g38532 = localfloat4switch99_g39551;
			float4 color301_g38532 = IsGammaSpace() ? float4(1,1,1,1) : float4(1,1,1,1);
			float4 _MASK_R1439_g38532 = SAMPLE_TEXTURE2D( _OcclusionMap, sampler_trilinear_repeat, UV40_g39580 );
			float4 temp_cast_13 = (i.vertexColor.a).xxxx;
			float4 lerpResult11_g38532 = lerp( _MASK_R1439_g38532 , temp_cast_13 , (float)_OcclusionSourceMode);
			float4 lerpResult14_g38532 = lerp( color301_g38532 , lerpResult11_g38532 , _OcclusionStrengthAO);
			o.Smoothness = ( temp_output_1267_33_g38532 * lerpResult14_g38532 ).x;
			o.Occlusion = saturate( lerpResult14_g38532 ).r;
			o.Alpha = 1;
		}

		ENDCG
	}
	Fallback "Diffuse"
}
/*ASEBEGIN
Version=18913
486;116;1467;857;74.19706;1294.581;1.672331;True;False
Node;AmplifyShaderEditor.CommentaryNode;290;1377.96,-881.2607;Inherit;False;349.5028;185.4201;DEBUG SETTINGS ;3;293;353;291;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;295;1375.783,-1014.665;Inherit;False;169;123;GLOBAL SETTINGS ;1;294;;0,0,0,1;0;0
Node;AmplifyShaderEditor.CommentaryNode;464;1375.689,-264.329;Inherit;False;325;121.5;DESF Common ASE Compile Shaders;1;465;;0,0.2605708,1,1;0;0
Node;AmplifyShaderEditor.FunctionNode;466;700.3963,-686.1646;Inherit;False;DESF Core Surface;3;;38532;c3df20d62907cd04086a1eacc41e29d1;19,1352,0,183,0,1382,1,1432,1,1433,1,1434,1,1491,0,1284,0,1446,0,307,0,312,0,1318,0,249,0,1319,0,1336,0,1337,0,1407,0,1443,0,1444,0;2;309;FLOAT3;0,0,0;False;1262;FLOAT4;0,0,0,0;False;10;FLOAT4;42;FLOAT3;39;FLOAT3;1473;COLOR;0;FLOAT4;41;COLOR;43;FLOAT;180;FLOAT;55;FLOAT;281;FLOAT3;313
Node;AmplifyShaderEditor.IntNode;291;1387.189,-839.5454;Inherit;False;Property;_ColorMask;Color Mask Mode;1;1;[Enum];Create;False;1;;0;1;None,0,Alpha,1,Red,8,Green,4,Blue,2,RGB,14,RGBA,15;True;0;False;15;15;False;0;1;INT;0
Node;AmplifyShaderEditor.RangedFloatNode;353;1391.431,-768.1531;Inherit;False;Constant;_MaskClipValue1;Mask Clip Value;14;0;Create;True;1;;0;0;False;0;False;0.5;0;0;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.IntNode;294;1392.596,-970.853;Inherit;False;Property;_CullMode;Cull Mode;2;2;[Header];[Enum];Create;True;1;GLOBAL SETTINGS;0;1;UnityEngine.Rendering.CullMode;True;0;False;0;2;False;0;1;INT;0
Node;AmplifyShaderEditor.FunctionNode;465;1387.689,-222.329;Inherit;False;DESF Common ASE Compile Shaders;-1;;39591;b85b01c42ba8a8a448b731b68fc0dbd9;0;0;1;FLOAT;0
Node;AmplifyShaderEditor.FunctionNode;462;1107.896,-681.6646;Inherit;False;DESF Module Detail;66;;39592;49c077198be2bdb409ab6ad879c0ca28;4,200,1,201,1,347,0,346,0;2;39;FLOAT4;0,0,0,0;False;38;FLOAT3;0,0,1;False;2;FLOAT4;73;FLOAT3;72
Node;AmplifyShaderEditor.IntNode;293;1569.695,-837.718;Inherit;False;Property;_ZWriteMode;ZWrite Mode;0;2;[Header];[Enum];Create;False;1;DEBUG SETTINGS;0;1;Off,0,On,1;True;0;False;1;1;False;0;1;INT;0
Node;AmplifyShaderEditor.StandardSurfaceOutputNode;194;1374.904,-680.6909;Float;False;True;-1;6;;200;0;Standard;DEC/Surface/Surface Detail;False;False;False;False;False;False;False;False;False;False;False;False;True;False;True;False;False;False;True;True;True;Back;0;True;293;3;False;292;False;0;False;-1;0;False;-1;False;0;Custom;0.5;True;True;-10;True;Opaque;;Geometry;All;18;all;True;True;True;True;0;True;291;False;0;False;-1;255;False;-1;255;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;-1;False;0;1;0;5;False;0.5;True;0;5;False;-1;10;False;-1;0;0;False;-1;0;False;-1;0;False;-1;0;False;-1;0;False;0;0,0,0,0;VertexOffset;True;False;Cylindrical;False;Relative;200;;-1;-1;-1;-1;1;NatureRendererInstancing=True;False;0;0;True;294;-1;0;True;353;5;Pragma;multi_compile_instancing;False;;Custom;Pragma;instancing_options procedural:SetupNatureRenderer forwardadd;False;;Custom;Pragma;multi_compile GPU_FRUSTUM_ON __;False;;Custom;Include;Nature Renderer.cginc;False;5d792e02fd6741e4cb63087f97979470;Custom;Pragma;multi_compile_local _ NATURE_RENDERER;False;;Custom;0;0;False;0.1;False;-1;0;False;-1;True;16;0;FLOAT3;0,0,0;False;1;FLOAT3;0,0,0;False;2;FLOAT3;0,0,0;False;3;FLOAT;0;False;4;FLOAT;0;False;5;FLOAT;0;False;6;FLOAT3;0,0,0;False;7;FLOAT3;0,0,0;False;8;FLOAT;0;False;9;FLOAT;0;False;10;FLOAT;0;False;13;FLOAT3;0,0,0;False;11;FLOAT3;0,0,0;False;12;FLOAT3;0,0,0;False;14;FLOAT4;0,0,0,0;False;15;FLOAT3;0,0,0;False;0
WireConnection;462;39;466;42
WireConnection;462;38;466;39
WireConnection;194;0;462;73
WireConnection;194;1;462;72
WireConnection;194;3;466;0
WireConnection;194;4;466;41
WireConnection;194;5;466;43
ASEEND*/
//CHKSM=B6995824DAEF3AF839AAC06B97BA37AC3C8181A4